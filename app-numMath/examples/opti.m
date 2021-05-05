clear;
clf;
close all;

% a=[-1,2,4,3,-3]'; % the given numbers
% f=@(x) sum((a-x).^2);
% 
% xx=linspace(min(a),max(a));
% plot(xx,f(xx))
% 
% [loc1,val1]=fminbnd(f, min(a), max(a))
% [loc2,val2]=fminunc(f,0)
% [loc3,val3]=fminsearch(f,0)
% ctrl+r

% xx=linspace(-2,2,30);
% [X,Y]=meshgrid(xx,xx);
% Z=X.^2-Y.^2;
% mesh(X,Y,Z)


xx=linspace(-5,5,30);
[X,Y]=meshgrid(xx,xx);
f=@(x,y) (x.^2+y-11).^2+(x+y.^2-7).^2;
Z=f(X,Y);
figure(1)
mesh(X,Y,Z);

figure(2)
contour(X,Y,Z)
[dX,dY]=gradient(Z);
L=sqrt(dX.^2+dY.^2);
hold on
quiver(X,Y,dX./L,dY./L)
%quiver(X,Y,dX,dY)

