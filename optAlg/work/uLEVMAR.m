function xx=uLEVMAR(feladat,x0)
% ez egy egyszerű változat

  lambda=0.01;
  fprintf("\nmódszer=Levenberg-Marquardt (lambda=%.3f)\n",lambda);

  stopcond=mystopcond() ;
  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  f=feladat.f ;
  df=feladat.df ;
  d2f=feladat.d2f ;
  numvar=feladat.numvar;


  xx = [x0] ;


  f0 = f(x0) ;
  df0 = df(x0) ;
  d2f0 = d2f(x0) ;

  
  niter = 0 ;
  flag = "none" ;
  
  lambda=lambda*eye(numvar) ;

  while true
    niter = niter + 1 ;
    if niter>maxit, flag = "maxit" ; break ; end


    M = d2f0+lambda ;
    p = M \ (-df0) ; 
    x1 = x0 + p ;

    f1 = f(x1) ;
    df1 = df(x1) ;

    if f1<f0
      lambda = 1.6*lambda ; 
    else
      lambda = 0.4*lambda ;
    end
    %lambda


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
    d2f0 = d2f(x1) ;
    if not (flag == "none"), break; end
  end

  hRESULT(feladat,flag,niter,xx);
  
  
end
