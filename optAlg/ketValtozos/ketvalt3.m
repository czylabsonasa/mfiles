clear all ;
clf ;

f = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;
fV = @(v) f(v(1),v(2)) ;


xb = linspace(-2,2,20) ;
yb = linspace(-2,2,20) ;
[X,Y] = meshgrid(xb, yb) ;
Z = f(X,Y) ;
% meshc(X,Y,Z) ;

contour(X,Y,Z) ;
hold on ;
[Gx,Gy]=gradient(Z) ;
Gx = -Gx ; % a csökkenés iránya érdekel
Gy = -Gy ;
L = sqrt(Gx.^2 + Gy.^2) ; % normálás
Gx = Gx ./ L ;
Gy = Gy ./ L ;

quiver(X,Y,Gx,Gy) ;

x0 = [0.5; 0.5] ;
% [loc, val, flag, out] = fminsearch(fv, x0) ;
% [loc, val, flag, out] = fminunc(fV, x0) ;



