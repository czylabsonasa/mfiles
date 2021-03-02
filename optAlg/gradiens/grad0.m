clc ;
clear all ;
clf ;

% behozzuk az aktualis fv-t
fun1 ;

% megállási feltételek
ftol = 1e-6 ;
dftol = 1e-9 ;
xtol = 1e-9 ;
maxit = 1000 ; 


fprintf("függvény:\n\t%s\n",fname);
fig = 0 ; % figure
for pt=pontok
  x0 = pt ;
  hold off ;
  fprintf('-----------------------------------------\n') ;
  fprintf("x0:\n\t(%.3f,%.3f)\n", x0(1), x0(2)) ;

  fig = fig + 1 ;
  figure(fig) ;
  % kontur kirajzolasa 
  [X,Y] = meshgrid(xb, yb) ;
  contour(X,Y,f(X,Y)) ;
  hold on ;
  axis equal ;

  f0 = fV(x0) ;
  df0 = dfV(x0) ;


  plot(x0(1), x0(2), 'xk') ;
  amax = 10 ; % ad-hoc
  nit = 0 ;
  flag = "none" ;

  while true
    nit = nit + 1 ;
    if nit>maxit flag = "maxit" ; break ; end

    % [alfa, f1] = fminsearch(@(a) fV(x0-a*df0),0) ;
    [alfa, f1] = fminbnd(@(a) fV(x0-a*df0), 0,amax) ;

    x1 = x0 - alfa*df0 ;
    df1 = dfV(x1) ;
    plot([x0(1),x1(1)], [x0(2),x1(2)], '-xk') ;


    if norm(df1)<dftol, flag = "dftol" ; break ; end
    if abs(f1-f0)<ftol, flag = "ftol" ; break ; end
    if norm(x1-x0)<xtol, flag = "xtol" ; break ; end
    x0 = x1 ;
    f0 = f1 ;
    df0 = df1 ;
  end

  fprintf("grad0:\n\t(%.3f,%.3f) flag=%s nstep=%d\n", x0(1), x0(2), flag, nit ) ;

  [loc, val, flag, out] = fminsearch(fV, x0) ;
  fprintf("fminsearch:\n\t(%.3f,%.3f) flag=%d nstep=%d\n", loc(1), loc(2), flag, out.iterations ) ;

  
  [loc, val, flag, out] = fminunc(fV, x0, optimoptions('fminunc','Display','none') ) ;
  fprintf("fminunc:\n\t(%.3f,%.3f) flag=%d nstep=%d\n", loc(1), loc(2), flag, out.iterations ) ;

end % kezdőpontok 
