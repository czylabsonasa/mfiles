clear all ;
clf ;


xb = linspace(-5, 5, 30) ;
yb = xb ;
[X,Y] = meshgrid(xb, yb) ;
% Z = X.^2 + Y.^2 -2*X ;
Z = X.^2 - Y.^2 + 2*X + 2*Y + X .*Y.^3 ;

% mesh(X,Y,Z) ;

contour(X,Y,Z) ;

return ;
dX = 2*X-2;
dY = 2*Y ;
hold on ;
quiver(X,Y,-dX,-dY) ;
