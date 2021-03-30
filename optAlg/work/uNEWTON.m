function xx=uNEWTON(feladat,x0)
  fprintf("\nNewton\n");

  stopcond=mystopcond() ;
  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  f=feladat.f ;
  df=feladat.df ;
  d2f=feladat.d2f ;

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


  hRESULT(feladat,flag,niter,xx);
  
end
