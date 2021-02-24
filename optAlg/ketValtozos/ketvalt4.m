clear all ;
clf ;

f = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;
fV = @(v) f(v(1),v(2)) ;
dfx = @(x,y) 3*x.^2-3 ;
dfy = @(x,y) 3*y.^2-3 ;
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

% ujraszámolja hogy ne legyen túl sok vektor
xb2 = linspace(a,b,15) ;
yb2 = linspace(a,b,15) ;
[X2,Y2] = meshgrid(xb2, yb2) ;
Z2 = f(X2,Y2) ;

subplot(2,1,1) ;
contour(X,Y,Z) ;
hold on ;
[Gx,Gy]=gradient(Z2) ;
quiver(X2,Y2,-Gx,-Gy) ;
axis equal ; % enélkül azt gondolhatjuk hogy valami nem OK

subplot(2,1,2) ;
contour(X,Y,Z) ;
hold on ;
quiver(X2,Y2,-dfx(X2,Y2),-dfy(X2,Y2)) ;
axis equal ;

x0 = [0.5; 0.5] ;
% [loc, val, flag, out] = fminsearch(fv, x0) ;
% [loc, val, flag, out] = fminunc(fV, x0) ;


