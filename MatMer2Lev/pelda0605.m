clf
clear
close

syms y(t)

% szimbolikus megoldas
equ = diff(y,t) == 1/t*y^2 ;
t0 = 1 ;
y0 = 1 ;
tv = 2 ;


mo = matlabFunction( dsolve( equ, y(t0) == y0 ) )

fprintf("a pontos = %f\n", mo(tv) ) ;

xx = linspace(t0, tv) ;
plot(xx, mo(xx) ) ;
hold on ;

f = @(t, y) 1./t .* y^2 ;


m = 5 ; % 5 egyforma lépésben t0 -> tv
h = (tv - t0)/m ;


% Euler 
plot( t0, y0, 'r*') ;
T = t0 ;
Y = y0 ;
for k = 1:m
  Y = Y + h*f(T, Y) ;
  T = T + h ;
  plot( T, Y, 'r*') ;
end

fprintf("Euler %d lépésben = %f\n", m, Y ) ;

% RK2
plot( t0, y0, 'g*') ;:
T = t0 ;
Y = y0 ;
for k = 1:m
  k1 = f(T,Y) ;
  k2 = f(T + h, Y + h*k1 ) ;
  Y = Y + h*(k1 + k2)/2 ;
  T = T + h ;
k  plot( T, Y, 'g*') ;
end

fprintf("RK1 %d lépésben = %f\n", m ,Y ) ;

% Matlab ode45
[T,Y] = ode45(f, [t0, tv], y0) ;
plot(T,Y,'k*');
fprintf("ode45 = %f\n", Y(end) ) ;
