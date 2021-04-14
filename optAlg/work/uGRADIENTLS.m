function xx=uGRADIENTLS(fun,x0,LS,a0)
  fprintf("\nmódszer = gradient descent + %s\n",LS.name);

  stopcond=STOPCOND() ;

  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  lsearch=LS.lsearch;

  f=fun.f ;
  df=fun.df ;

  f0 = f(x0) ;
  df0 = df(x0) ;

  xx = [x0];

  niter = 0 ;
  flag = "none" ;

  while true
    niter = niter + 1 ;

    if niter>maxit flag = "maxit" ; break ; end
    p=(-df0);
    p=p/(1+norm(p));
    [alfa,f1] = lsearch(fun,x0,p,a0);



    x1 = x0 + alfa*p ;

% x1,f1

    df1 = df(x1) ;

    if norm(df1)<dftol
      flag = "dftol" ;
    elseif abs(f1-f0)<ftol
      flag = "ftol" ;
    elseif norm(x1-x0)<xtol
      flag = "xtol" ;
    end
    x0 = x1 ;
    xx=[xx,x0];
    f0 = f1 ;
    df0 = df1 ;
    %x0,f0
    if not (flag == "none"), break; end
  end
  
  hRESULT(fun,flag,niter,xx);
  
end
