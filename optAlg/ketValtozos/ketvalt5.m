clear all ;
clf ;

f = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;
fV = @(v) f(v(1),v(2)) ;
dfx = @(x,y) 3*x.^2-3 ;
dfy = @(x,y) 3*y.^2-3 ;
dfV =@(v) [dfx(v(1),v(2)) ; dfy(v(1),v(2)) ] ;
a = -2 ; b = 2 ;
xb = linspace(a,b,50) ;
yb = linspace(a,b,50) ;

% f = @(x,y) sin(x).*cos(y) ;
% fV = @(v) f(v(1),v(2)) ;
% dfx = @(x,y) cos(x).*cos(y) ;
% dfy = @(x,y) -sin(x).*sin(y) ;
% a = 0 ; b = 6 ;
% xb = linspace(a,b,50) ;
% yb = linspace(a,b,50) ;

[X,Y] = meshgrid(xb, yb) ;
Z = f(X,Y) ;
contour(X,Y,Z) ;
hold on ;
axis equal ;

% [loc, val, flag, out] = fminsearch(fv, x0) ;
% [loc, val, flag, out] = fminunc(fV, x0) ;

% egyszerű gradiens alapú vonalmenti keresés
% Armijo feltétel
% a par nevu struct-ot adjuk at a módszernek
par.alfa0 = 0.99 ;
par.c1 = 0.6 ;
par.ro = 0.5 ;
par.fun = fV ;

% megállási feltételek
ftol = 1e-6 ;
dftol = 1e-3 ;
xtol = 1e-9 ;
alfatol = 1e-9 ;

x0 = [0.5; 0.8] ; % próbáljuk különböző kezdőpontokból
f0 = fV(x0) ;
df0 = dfV(x0) ;
nstep = 0 ;
flag = 0 ;
while true
  nstep = nstep + 1 ;
  p = -df0 ; 
  alfa = armijo(x0, f0, df0, p, par) ;
  if alfa<alfatol  flag=1; break ; end
  x1 = x0 + alfa*p ;
  f1 = fV(x1) ;
  df1 = dfV(x1) ;
  if norm(df1)<dftol flag=2 ;break ; end
  if abs(f1-f0)<ftol flag=3; break ; end
  if abs(x1-x0)<xtol flag=4; break ; end
  x0 = x1 ;
  f0 = f1 ;
  df0 = df1 ;
end
fprintf("\nuser:\t x=(%.3f,%.3f) flag=%d nstep=%d\n", x0(1), x0(2), flag, nstep ) ;


[loc, val, flag, out] = fminsearch(fV, x0) ;
fprintf("\nfminisearch:\t x=(%.3f,%.3f) flag=%d nstep=%d\n", loc(1), loc(2), flag, out.iterations ) ;

[loc, val, flag, out] = fminunc(fV, x0) ;
fprintf("\nfminunc:\t x=(%.3f,%.3f) flag=%d nstep=%d\n", loc(1), loc(2), flag, out.iterations ) ;





% ha szkriptet csinálunk a végén kell lenni a definícióknak
function alfa=armijo(x,fx,dfx,p,par)
  alfa = par.alfa0 ;
  c1 = par.c1 ;
  ro = par.ro ;
  f = par.fun ;
  d = dot(dfx,p) ;
  while f(x+alfa*p) > fx + alfa*c1*d
    alfa = alfa*ro ;
  end
end
