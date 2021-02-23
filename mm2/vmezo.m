clear all ; 
clf ;

K = sqrt(28/3)-0.1 ;
f = @(t, y)  6*t .* y.^2 ;

tb = -K:0.2:K ;
yb = -0.5:0.2:0.5 ;

[T,Y] = meshgrid(tb, yb) ;
dY = f(T, Y) ;
dT = ones(size(dY)) ;
quiver(T,Y, dT, dY) ;

% t = 1, y = 1/25 => C
C = -28 ;
mo = @(x) -1 ./ (3*x.^2 + C) ;

xx = linspace(-K,K) ;
hold on ;
plot(xx, mo(xx)) ;

