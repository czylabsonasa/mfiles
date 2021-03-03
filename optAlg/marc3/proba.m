clc ; clear ; clf ;

fun3sol ;

[X,Y] = meshgrid(xb, yb) ;
% meshc(X,Y,f(X,Y))
contourf(X,Y,f(X,Y),100)