clear all ;
clf ;

f = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;
fv = @(v) f(v(1),v(2)) ;

xb = linspace(-2,2,50) ;
yb = linspace(-2,2,50) ;
[X,Y] = meshgrid(xb, yb) ;
Z = f(X,Y) ;
mesh(X,Y,Z) ;

