% Rosenbrock

f = @(x,y) 100*(y-x.^2).^2 + (1-x).^2 ;
fV = @(v) f(v(1),v(2)) ;

dfx = @(x,y) -400*x.*(y-x.^2) + 2*(x-1) ; % hoppá: itt benne maradt egy négyzet!!!
dfy = @(x,y) 200*(y-x.^2) ;

dfV =@(v) [dfx(v(1),v(2)) ; dfy(v(1),v(2)) ] ;
d2fV = @(v) [ 1200*v(1)^2-400*v(2)+2, -400*v(1) ; -400*v(1), 200] ;

% a tartomany
xmin = -1.5 ; xmax = 2 ;
xb = linspace(xmin,xmax,50) ;
ymin = -3.5 ; ymax = 4 ;
yb = linspace(ymin,ymax,50) ;

% név
fname="Rosenbrock" ;
pontok = [ 0.5 0.5;   0.7 0.9;  -1.2 1; rand() rand() ]' ;
% pontok = [ -1.2  1 ]' ;
