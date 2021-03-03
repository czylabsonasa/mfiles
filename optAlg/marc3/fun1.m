% nyújtott köbös
f = @(x,y) 10*x.^3 + y.^3 - 30*x - 3*y ;
fV = @(v) f(v(1),v(2)) ;
dfx = @(x,y) 30*x.^2-30 ;
dfy = @(x,y) 3*y.^2-3 ;
dfV =@(v) [dfx(v(1),v(2)) ; dfy(v(1),v(2)) ] ;

% a tartomany
xmin = -2 ; xmax = 2 ;
xb = linspace(xmin,xmax,50) ;
ymin = -2 ; ymax = 2 ;
yb = linspace(ymin,ymax,50) ;

% név
fname="nyújtott köbös" ;
pontok = [ -0.5 -0.5;   0 -0.9;  -1 0 ]' ;
