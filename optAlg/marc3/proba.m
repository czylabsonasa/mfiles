clc ; clear ; clf ;

fun2 ;

[X,Y] = meshgrid(xb, yb) ;
meshc(X,Y,f(X,Y))