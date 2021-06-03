clf
clear all
close all


f = @(t,y) y./t - t.^2 ;

tb = linspace(1,3,30);
[T,Y] = meshgrid(tb, tb) ;
dY = f(T,Y) ;
dT = ones(size(dY)) ;
%L = sqrt(dT.^2 + dY.^2) ;
quiver(T,Y,dT,dY)


t0 = 1 ;
y0 = 2 ;

syms y(t)
egyenlet = diff(y,t) == y/t - t^2 ;
f1 = matlabFunction(dsolve(egyenlet, y(t0)==y0)) ;
xx = linspace(1,2) ;
hold on ;
plot(xx, f1(xx))


