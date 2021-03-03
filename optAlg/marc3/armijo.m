clc ;
clear ;
close all;

% behozzuk az aktualis fv-t
fun4sol ;

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
  fprintf("fminsearch:\n\t(%.3f,%.3f) flag=%d nstep=%d funcCount=%d\n", loc(1), loc(2), flag, out.iterations, out.funcCount ) ;

  
  [loc, val, flag, out] = fminunc(fV, x0, optimoptions('fminunc','Display','none') ) ;
  fprintf("fminunc:\n\t(%.3f,%.3f) flag=%d nstep=%d funcCount=%d\n", loc(1), loc(2), flag, out.iterations, out.funcCount ) ;


  fig = fig + 1 ;
  figure(fig) ;
  clf ;
  % kontur kirajzolasa minden fig-re
  contour(X,Y,f(X,Y)) ;
  hold on ;
  axis equal ;

  f0 = fV(x0) ;
  df0 = dfV(x0) ;


  plot(x0(1), x0(2), 'ok') ;
  alfatol = 1e-9 ; % ad-hoc
  nit = 0 ;
  fcount = 2 ;
  flag = "none" ;

  while true
    nit = nit + 1 ;
    if nit>maxit flag = "maxit" ; break ; end

    p = -df0 ;
    [alfa, fcnt] = armijoAlfa(fV, x0, f0, df0, p) ;
    fcount = fcount + fcnt ;

    x1 = x0 + alfa*p ;
    f1 = fV(x1) ;
    df1 = dfV(x1) ;
    fcount = fcount + 3; % d-dim, gradiens d=2
    plot([x0(1),x1(1)], [x0(2),x1(2)], '-xk') ;
    

    if alfa<alfatol, flag = "alfa" ; break ; end
    if norm(df1)<dftol, flag = "dftol" ; break ; end
    if abs(f1-f0)<ftol, flag = "ftol" ; break ; end
    if norm(x1-x0)<xtol, flag = "xtol" ; break ; end
    x0 = x1 ;
    f0 = f1 ;
    df0 = df1 ;
  end

  fprintf("armijo:\n\t(%.3f,%.3f) flag=%s nstep=%d funcCount=%d\n", x0(1), x0(2), flag, nit, fcount ) ;


end % kezdőpontok 


function [alfa,fcnt]=armijoAlfa(f,x,fx,dfx,p)
  alfa = 10 ; % alfa0
  c1 = 0.001 ; % c1
  ro = 0.5 ; % rho
  d = dot(dfx,p) ;
  fcnt = 1 ;
  while f(x+alfa*p) > fx + alfa*c1*d
    alfa = alfa*ro ;
    fcnt = fcnt + 1 ;
  end
end
