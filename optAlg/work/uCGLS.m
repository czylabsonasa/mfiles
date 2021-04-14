function xx=uCGLS(fun,x0,LS,a0)
  fprintf("\nmódszer = nemlineáris konjugált gradiens + %s\n",LS.name);

  stopcond=STOPCOND() ;
  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  f=fun.f ;
  df=fun.df ;
  n=fun.numvar;

  lsearch=LS.lsearch;
  
  x=x0;
  xx = [x] ;

  flag = "none" ;
  it = 0 ;
  r=-df(x0); % negatív gradiens (rezidual,maradék)
  d=r;
  deltaU=r'*r;
  tol=dftol^2*deltaU;
  
  k=0; % újrakezdés
  while true
    it = it + 1;
    if deltaU<tol, flag="ok"; break; end
    if it>maxit, flag="maxit"; break; end
    [alfa,~] = lsearch(fun,x,d,a0);
    x=x+alfa*d;
    xx=[xx,x];

    r=-df(x);
    deltaR=deltaU;
    deltaU=r'*r;
    beta=deltaU/deltaR; % Fletcher

    d=r+beta*d;
    k=k+1;
    if k>=1.1*n || r'*d<=0
      k=0;
      d=r;
    end
  end

  hRESULT(fun,flag,it,xx);
  
end
