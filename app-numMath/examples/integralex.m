f=@(x) sqrt(1-x.^2) ;
a=0; b=1;
m=100;

h=(b-a)/m;

% compound midpoint
mp=a+h/2:h:b-h/2;
CM=h*sum(f(mp));

% compound trapesoidal
tp=a+h:h:b-h;
CT=h*(f(a)/2 + sum(f(tp)) + f(b)/2);

% compound Simpson
CS=h/6*(f(a) + 4*sum(f(mp)) + 2*sum(f(tp)) + f(b)) ;

abs([CM, CT, CS] - integral(f,a,b))







