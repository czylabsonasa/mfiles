clear;
clf;
close all;

f=@(x,y) ((1521/64).x.^2-(39/8).y-11).^2+((39/8).x+(1521/64).y.^2-7).^2;
[x_sol, f_min] = fmincon(@(x) f(x(1), x(2)), [-40/39 40/39])
 
[X,Y] = meshgrid(linspace(-40/39,40/39,100)+x_sol(1), linspace(-40/39,40/39,100)+x_sol(2));
Z = f(X,Y);
 
ax = axes();
surf(X,Y,Z);
hold on;
plot3(x_sol(1), x_sol(2), f_min, 'r+', 'LineWidth', 3, 'MarkerSize', 10);

return;


xx=linspace(-1,1,100);
yy=linspace(-0.7,0.8,100);
[X,Y]=meshgrid(xx,xx);
%f=@(x,y) (x.^2+y-11).^2+(x+y.^2-7).^2;
% f=@(x,y) (x.^5-3*x.^3+2*y.^3+y.^2-x.*y);
f=@(x,y) (1521/64*x.^2-39/8*y -11).^2 +...
  (39/8*x+1521/64*y.^2 -7).^2;

F=@(v) f(v(1),v(2));

Z=f(X,Y);
% figure(1)
%mesh(X,Y,Z);

%return

% figure(2)
contour(X,Y,Z,100)
return
[dX,dY]=gradient(Z);
L=sqrt(dX.^2+dY.^2);
hold on
%quiver(X,Y,-dX./L,-dY./L)
quiver(X,Y,dX,dY)
%[l1,v1]=fminunc(F,[-3 3.2])



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


