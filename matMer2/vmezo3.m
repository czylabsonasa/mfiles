% simple disease spread model
% y' = Cy(N-y)

clear ;
clf ;


syms y(t) ;
N=1000 ; D = 2000;
egyenlet = diff(y,t) == y*(N-y)/D ;
% we have 1 patient zero at the beginning
mo=matlabFunction(dsolve(egyenlet, y(0)==1)) ;

f = @(t,y) y.*(N-y)/D ;
tmax = 20 ; dt = tmax/10 ;
ymax= mo(tmax) ; dy = ymax/10 ;



tb = 0:dt:tmax ;
yb = 0:dy:ymax ;

[T, Y] = meshgrid(tb, yb) ;

dY = f(T, Y) ;
dT = ones(size(dY)) ;

quiver(T,Y,dT,dY, '.') ; % '.' linespec parameter, nincs feje a nyilaknak

xx = linspace(0,tmax) ;
hold on ;
plot(xx, mo(xx),'r') ;

xlim([0-dt,tmax+dt]) ;
ylim([0-dy,ymax+dy]) ;


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









