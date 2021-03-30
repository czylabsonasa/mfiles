function xx=uGRADIENTLS(feladat,pt0,lsearch)
  fprintf("\ngradient+line search\n");

  stopcond=mystopcond() ;
  
  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  f=feladat.f ;
  df=feladat.df ;

  f0 = fV(x0) ;
  df0 = dfV(x0) ;

  plot(x0(1), x0(2), 'or') ;
  nit = 0 ;
  fcount = 2 ;
  flag = "none" ;

  while true
    nit = nit + 1 ;

    if nit>maxit flag = "maxit" ; break ; end
    [alfa,f1,~,out] = fminunc(@(a) fV(x0-a*df0),0,...
        optimoptions('fminunc','Display','none')) ;
    fcount = fcount + out.funcCount ;

    x1 = x0 - alfa*df0 ;
    df1 = dfV(x1) ;
    fcount = fcount + 2; % d-dim, gradiens d=2
    plot([x0(1),x1(1)], [x0(2),x1(2)], '-xk') ;

    if norm(df1)<dftol
      flag = "dftol" ;
    elseif abs(f1-f0)<ftol
      flag = "ftol" ;
    elseif norm(x1-x0)<xtol
      flag = "xtol" ;
    end
    x0 = x1 ;
    f0 = f1 ;
    df0 = df1 ;
    if not (flag == "none"), break; end
  end
  
  loc = x0 ;
  val = f0 ;
  
  fprintf("%s\n",fname);
  fprintf("x0=(%.3f,%.3f)\n", pt0(1), pt0(2)) ;
  fprintf("flag=%s nstep=%d funcCount=%d\n", flag, nit, fcount ) ;
  fprintf("x=(%.3f,%.3f)    fx=%.3f    |dfx|=%.3f\n",...
    loc(1), loc(2), val, norm(dfV(loc))) ;
  fprintf("\n") ;
  % fprintf("##################\n")
  
end
