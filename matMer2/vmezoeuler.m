clear all ; 
clf ;

f = @(t, y)  -4*y./t+t.^3.*y.^2;

tb = 0.5:0.03:2.5 ;
yb = 0.1:0.1:1.1 ;

[T,Y] = meshgrid(tb, yb) ;
dY = f(T, Y) ;
dT = ones(size(dY)) ;
quiver(T,Y, dT, dY) ;


mo = @(t) 1 ./(1-log(t)) .*t.^(-4) ;

xx = linspace(0.5,2.5) ;
hold on ;
plot(xx, mo(xx)) ;
pontos=mo(2)

ylim([0.1,1.1]) ;

lepes=200;


% Euler
t0=1; tv=2; 
y0=1;
delta = (tv-t0)/lepes;
for i=1:lepes
  y0=y0+delta*f(t0,y0);
  t0=t0+delta;
end
abs(y0-pontos)


% modEuler
t0=1; tv=2; 
y0=1;
lepes = lepes/2;
delta = (tv-t0)/lepes;
for i=1:lepes
  ym=y0+0.5*delta*f(t0,y0);
  tm=t0+0.5*delta;

  y0=y0+f(tm,ym)*delta; 
  t0=t0+delta;
end
abs(y0-pontos)

