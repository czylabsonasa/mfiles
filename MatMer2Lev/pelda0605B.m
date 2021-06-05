clf
clear
close

t0 = 0 ;
y0 = 1 ; 
dy0 = 1 ;

tv = 2 ;

xx = linspace(0,2);
plot(xx,exp(xx)) ;
hold on ;


f = @(t, Y) [Y(2); 3*Y(1)-2*Y(2)] ;


m = 5 ; % 5 egyforma lépésben t0 -> tv
h = (tv - t0)/m ;


% Euler 
plot( t0, y0, 'r*') ;
T = t0 ;
Y = [y0; dy0] ;
for k = 1:m
  Y = Y + h*f(T, Y) ;
  T = T + h ;
  plot( T, Y(1), 'r*') ;
end

fprintf("Euler %d lépésben = %f\n", m, Y(1)) ;

% RK2
plot( t0, y0, 'g*') ;
T = t0 ;
Y = [y0; dy0] ;
for k = 1:m
  k1 = f(T,Y) ;
  k2 = f(T + h, Y + h*k1 ) ;
  Y = Y + h*(k1 + k2)/2 ;
  T = T + h ;
  plot( T, Y(1), 'g*') ;
end
fprintf("RK2 %d lépésben = %f\n", m, Y(1)) ;


% Matlab ode45
[T,Y] = ode45(f, [t0, tv], [y0; dy0]) ;
plot(T,Y,'k*');
fprintf("ode45 = %f\n", Y(end) ) ;
