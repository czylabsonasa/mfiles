clc ;
clear ;
close all;

% behozzuk az aktualis fv-t
fun2 ;

% megállási feltételek
ftol = 1e-6 ;
dftol = 1e-9 ;
xtol = 1e-9 ;
maxit = 1000 ; 


[X,Y] = meshgrid(xb, yb) ; % csak 1x

fprintf("függvény:\n\t%s\n",fname);
fig = 0 ; % figure
for pt=pontok
  x0 = pt ;
  hold off ;
  fprintf('-----------------------------------------\n') ;
  fprintf("x0:\n\t(%.3f,%.3f)\n", x0(1), x0(2)) ;

  [loc, val, flag, out] = fminsearch(fV, x0) ;
  fprintf("fminsearch:\n\t(%.3f,%.3f) flag=%d nstep=%d funcCount=%d\n",...
    loc(1), loc(2), flag, out.iterations, out.funcCount ) ;

  
  [loc, val, flag, out] = fminunc(fV, x0, optimoptions('fminunc','Display','none') ) ;
  fprintf("fminunc:\n\t(%.3f,%.3f) flag=%d nstep=%d funcCount=%d\n",...
    loc(1), loc(2), flag, out.iterations, out.funcCount ) ;


  fig = fig + 1 ;
  figure(fig) ;
  clf ;
  % kontur kirajzolasa minden fig-re
  contour(X,Y,f(X,Y)) ;
  hold on ;
  axis equal ;

  f0 = fV(x0) ;
  df0 = dfV(x0) ;


  plot(x0(1), x0(2), 'xk') ;
  amax = 10 ; % ad-hoc
  nit = 0 ;
  fcount = 2 ;
  flag = "none" ;

  while true
    nit = nit + 1 ;
    if nit>maxit flag = "maxit" ; break ; end

    alfa = inv(d2fV(x0)) ; 
    x1 = x0 - alfa*df0 ;
    f1 = fV(x1) ;
    df1 = dfV(x1) ;
    fcount = fcount + 4 ; % es az invertalast nem is szamoltuk
    plot([x0(1),x1(1)], [x0(2),x1(2)], '-xk') ;


    if norm(df1)<dftol, flag = "dftol" ; break ; end
    if abs(f1-f0)<ftol, flag = "ftol" ; break ; end
    if norm(x1-x0)<xtol, flag = "xtol" ; break ; end
    x0 = x1 ;
    f0 = f1 ;
    df0 = df1 ;
  end

  fprintf("grad0:\n\t(%.3f,%.3f) flag=%s nstep=%d funcCount=%d\n",...
    x0(1), x0(2), flag, nit, fcount ) ;


end % kezdőpontok 
