function mygradFMU(feladat,pt0)
  fprintf("\ngrad+FMU(1d)\n");

  stopcond=mystopcond() ;
  
  ftol=stopcond.ftol ;
  dftol=stopcond.dftol ;
  xtol=stopcond.xtol ;
  maxit=stopcond.maxit ;

  fname=feladat.fname ;
  numvar=feladat.numvar;
  f=feladat.f ;
  fV=feladat.fV ;
  dfV=feladat.dfV ;
  xb=feladat.xb ;
  yb=feladat.yb ;

  if pt0(1)<feladat.xmin || pt0(1) > feladat.xmax ||...
      pt0(2)<feladat.ymin || pt0(2) > feladat.ymax
    fprintf('a kezdőpont nincs benne a tartományban\n\n') ;
    return ;
  end
  
  [X,Y] = meshgrid(xb, yb) ; % csak 1x

  x0 = pt0 ;
  
  clf ;
  contour(X,Y,f(X,Y)) ;
  hold on ;
  axis equal ;

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
