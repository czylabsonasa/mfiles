% befejezetlen !!!
function mybfgsFMU(feladat,pt0)
  fprintf("\nBroyden-Fletcher-Goldfarb-Shanno + fminunc\n");

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

  
  [X,Y] = meshgrid(xb, yb) ;

  x0 = pt0 ;
  
  clf ;
  contour(X,Y,f(X,Y)) ;
  hold on ;
  axis equal ;

  f0 = fV(x0) ;
  df0 = dfV(x0) ;
  

  % kontur kirajzolasa minden fig-re
  contour(X,Y,f(X,Y)) ;
  tit = sprintf('(%.3f,%.3f)',x0(1),x0(2));
  title(tit) ;

  hold on ;

  f0 = fV(x0) ;
  df0 = dfV(x0) ;


  plot(x0(1), x0(2), 'or') ; axis square ;
  
  nit = 0 ;
  fcount = 1 + 2 ;
  flag = "none" ;
  A = eye(numvar) ;

  while true
    nit = nit + 1 ;
    if nit>maxit, flag = "maxit" ; break ; end

    % ez ugyanaz mint a DFP-ben
    p = (-df0) ;
    
    [alfa,f1,~,out] = fminunc(@(a) fV(x0+a*p),0.1,...
        optimoptions('fminunc','Display','none')) ;
    fcount = fcount + out.funcCount ;
    x1 = x0 + alfa*p ;

    % f1 = fV(x1) ; mar megvan
    df1 = dfV(x1) ;
    dx = x1 - x0 ;
    dg = df1 - df0 ;
    
    fcount = fcount + 2 ; % 
    
    % itt ugy csinalja hogy megprobal kozel lenni 
    % a Hesse matrix-hoz A-val
    A = A + (dx*dx')/(dx'*dg) - (A*(dg*dg')*A)/(dg'*A*dg) ;
    p = A * (-df1) ; % ebben az iranyban keres
    
    [alfa,f2,~,out] = fminunc(@(a) fV(x1+a*p),0.1,...
        optimoptions('fminunc','Display','none')) ;
    fcount = fcount + out.funcCount ;
    
    x2 = x1 + alfa*p ;
    
    
    if f2<f1
    x1 = x2 ;
    f1 = f2 ;
    df1 = dfV(x2) ;
    end
    
    fcount = fcount + 2 ; % 
    
    plot([x0(1),x1(1)], [x0(2),x1(2)], '-xk') ; axis square ;


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
  fprintf("x=(%.3f,%.3f)    fx=%.3f    |dfx|=%.3f\n", loc(1), loc(2), val, norm(dfV(loc))) ;
  fprintf("\n") ;
  % fprintf("##################\n")
  
  
end
