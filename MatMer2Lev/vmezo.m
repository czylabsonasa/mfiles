clear ;
clf ;
close ;

f = @(t,y) y + t - cos(t) ;



tb = linspace(-1,2,20);
yb = linspace(-5,7,20);
[T, Y] = meshgrid(tb, yb) ;

dY = f(T,Y) ;
dT = ones(size(dY)) ;

quiver(T,Y, dT, dY) ;

% y(-1)=0
syms y(t) ;
egyenlet = diff(y,t) == y + t - cos(t) ;
sol1 = matlabFunction( dsolve(egyenlet, y(-1) == 0) );

sol1 

xx = linspace(-1,2) ;

hold on ;
plot(xx, sol1(xx))


axis square