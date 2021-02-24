clear all ;
clf ;

f = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;

fv = @(v) f(v(1),v(2)) ;

xb = linspace(-2,2,100) ;
yb = linspace(-2,2,100) ;
[X,Y] = meshgrid(xb, yb) ;
Z = f(X,Y) ;
meshc(X,Y,Z) ;

