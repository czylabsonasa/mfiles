clear all ;
clf ;

f = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;
fv = @(v) f(v(1),v(2)) ;

xb = linspace(-2,2,50) ;
yb = linspace(-2,2,50) ;
[X,Y] = meshgrid(xb, yb) ;
Z = f(X,Y) ;
meshc(X,Y,Z) ;

x0 = [0.5; 0.5] ;
[loc, val] = fminsearch(fv, x0) ;
hold on ;
plot3(x0(1),x0(2),-4,'o', loc(1), loc(2),-4,'*') ;


