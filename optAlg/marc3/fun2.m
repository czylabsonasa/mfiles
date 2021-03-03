% kvadratikus
AA = [ 8 6; 6 8] ;
bb = [ 7 ; -3] ;
cc = -1 ;

f = @(x,y) 4*x.^2 + 6*x.*y + 4*y.^2 + 7*x - 3*y -1 ;

fV = @(v) 0.5*v'*AA*v + bb'*v + cc ;
dfV =@(v) AA*v + bb ;
d2fV = @(v) AA

% a tartomany
xmin = -5 ; xmax = 5 ;
xb = linspace(xmin,xmax,50) ;
ymin = -5 ; ymax = 5 ;
yb = linspace(ymin,ymax,50) ;

% név
fname="kvadratikus" ;
pontok = [ -0.2 -2;   0 -0.9;  5 3 ]' ;
