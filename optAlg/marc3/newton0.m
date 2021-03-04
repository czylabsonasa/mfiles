clc ;
clear ;
close all;

% behozzuk az aktualis fv-t
fun5 ;

% megállási feltételek
ftol = 1e-3 ;
dftol = 1e-3 ;
xtol = 1e-9 ;
maxit = 1000 ; 


[X,Y] = meshgrid(xb, yb) ; % csak 1x

fprintf("függvény:\n\t%s\n",fname);
fig = 0 ; % figure
for pt=pontok
  x0 = pt ;
  
  fprintf('-----------------------------------------\n') ;
  fprintf("x0:\n\t(%.3f,%.3f)\n", x0(1), x0(2)) ;

  [loc, ~, flag, out] = fminsearch(fV, x0) ;
  fprintf("fminsearch:\n\t(%.3f,%.3f) flag=%d nstep=%d funcCount=%d\n",...
    loc(1), loc(2), flag, out.iterations, out.funcCount ) ;

  
  [loc, ~, flag, out] = fminunc(fV, x0, optimoptions('fminunc','Display','none') ) ;
  fprintf("fminunc:\n\t(%.3f,%.3f) flag=%d nstep=%d funcCount=%d\n",...
    loc(1), loc(2), flag, out.iterations, out.funcCount ) ;


  hold off ;
  fig = fig + 1 ;
  figure(fig) ;
  clf ;
  
  % kontur kirajzolasa minden fig-re
  contour(X,Y,f(X,Y)) ;
  tit = sprintf('(%.3f,%.3f)',x0(1),x0(2));
  title(tit) ;

  hold on ;

  f0 = fV(x0) ;
  df0 = dfV(x0) ;


  plot(x0(1), x0(2), 'ok') ; axis square ;
  
  nit = 0 ;
  fcount = 1 + 2 ;
  flag = "none" ;

  while true
    nit = nit + 1 ;
    if nit>maxit, flag = "maxit" ; break ; end

    pause();
    p = d2fV(x0) \ (-df0) ;
    x1 = x0 + p ;
    f1 = fV(x1) ;
    df1 = dfV(x1) ;
    fcount = fcount + 1+2+4 ; % 
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
  
  fprintf("newton0:\n\t(%.3f,%.3f) flag=%s nstep=%d funcCount=%d\n",...
    x0(1), x0(2), flag, nit, fcount ) ;


end % kezdőpontok 
