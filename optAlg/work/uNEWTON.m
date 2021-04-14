function xx=uNEWTON(fun,x0)
  fprintf("módszer = Newton\n");

  stopcond=STOPCOND() ;
  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  f=fun.f ;
  df=fun.df ;
  d2f=fun.d2f ;

  xx = [x0] ;

  f0 = f(x0) ;
  df0 = df(x0) ;

  niter = 0 ;
  flag = "none" ;

  while true
    niter = niter + 1 ;
    if niter>maxit, flag = "maxit" ; break ; end

    p = d2f(x0) \ (-df0) ;
    x1 = x0 + p ;

    f1 = f(x1) ;
    df1 = df(x1) ;


    if norm(df1)<dftol
      flag = "dftol" ;
    elseif abs(f1-f0)<ftol
      flag = "ftol" ;
    elseif norm(x1-x0)<xtol
      flag = "xtol" ;
    end
    x0 = x1 ;
    xx=[xx,x0] ;
    f0 = f1 ;
    df0 = df1 ;
    if not (flag == "none"), break; end
  end


  hRESULT(fun,flag,niter,xx);
  
end
