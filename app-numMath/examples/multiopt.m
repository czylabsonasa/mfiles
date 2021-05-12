clf
clear all
close all


f=@(x,y) (81/64*x.^2-9/8*y-11).^2 + (-9/8*x+81/64*y.^2-7).^2;
dd=linspace(-4.5,4.5,50);
[X,Y]=meshgrid(dd,dd);
Z=f(X,Y);
[Gx,Gy]=gradient(Z);
L=sqrt(Gx.^2+Gy.^2);
contour(X,Y,Z)
hold on
quiver(X,Y,Gx./L,Gy./L)

F=@(v) f(v(1),v(2))

[l1,v1]=fminunc(F,[-3.5,1.5])
[l2,v2]=fminunc(F,[-2.5,-2])
[l3,v3]=fminunc(F,[2.5,-3])
[l4,v4]=fminunc(F,[3.5,2.5])

