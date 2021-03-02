% syms y(t) ;
% egyenlet = diff(y,t) == y/t + t*y^2 ;
% dsolve(egyenlet, y(1)==1)


clear ;
clf ;

f = @(t,y) -2*y.*exp(t) + y.^2 + exp(2*t) + exp(t) ;

tb = 0.95:0.05:3 ;
yb = 0.8:0.1:3.4 ;

[T, Y] = meshgrid(tb, yb) ;

dY = f(T, Y) ;
dT = ones(size(dY)) ;

quiver(T,Y,dT,dY) ;

% 3t/(4-t^3), y(1)=1
% y(1.4) = 3 ?
C = (2-exp(1))/(1-exp(1)) 
sol = @(t) 1 ./ (C-t) + exp(t);
xx = linspace(1,1.4) ;
hold on ;
plot(xx, sol(xx)) ;

pontos = sol(3)

% lepes = 100 ;
% 
% % Euler
% t0 = 1; y0 = 1; 
% tv = 1.4 ;
% dt = (tv -t0)/lepes ;
% plot(t0,y0,'*k') ;
% for i=1:lepes
%   y0 = y0 + dt * f(t0,y0) ;
%   t0 = t0+dt ;
%   plot(t0,y0,'*k') ;
% end
% 
% abs(pontos-y0)









