clear; 
close ;
clf ;

t = [0 2 3 8 8]' ;
f = [93 324 428 997 1000]' / 100 ;

plot(t,f,'*') ;
xlim([min(t)-1, max(t)+1]) ;
ylim([min(f)-3, max(f)+3]) ;

% polyfit
p = polyfit(t, f, 1) ;
ertek= polyval(p, 10)

v = polyval(p, t) - f ;
delta = v'*v

xx = linspace(min(t)-1, max(t)+1) ;
hold on ;
plot(xx, polyval(p, xx)) ;


A = [ ones(size(t)), t ] ;
alfa = A'*A \ A'*f ;

[flip(alfa), p']

% F = @(x) alfa(1) + alfa(2)*sin(pi*x) + alfa(3)*cos(pi*x);
F = @(x) alfa(1) + alfa(2)*x ;

F(10)

% xx = linspace(min(t)-1, max(t)+1) ;
% hold on ;
% plot(xx, F(xx)) ;


% M= A'A
M = [length(t), sum(t); sum(t), sum(t.^2)] ;
alfa = M \ [sum(f); sum(t.*f)]









