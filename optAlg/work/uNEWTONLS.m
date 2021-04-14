function xx=uNEWTONLS(fun,x0,LS,a0)
  fprintf("\nmódszer=Newton + %s\n",LS.name);

  stopcond=STOPCOND() ;
  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  f=fun.f ;
  df=fun.df ;
  d2f=fun.d2f ;

  lsearch=LS.lsearch;
  
  
  xx = [x0] ;

  f0 = f(x0) ;
  df0 = df(x0) ;

  
  niter = 0 ;
  flag = "none" ;

  while true
    niter = niter + 1 ;
    if niter>maxit, flag = "maxit" ; break ; end

    p = d2f(x0) \ (-df0) ; 
    [alfa,f1] = lsearch(fun,x0,p,a0) ;
    x1 = x0 + alfa*p ;

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

  hRESULT(fun, flag, niter, xx);

end
