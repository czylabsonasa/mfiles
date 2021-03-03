% kvadratikus
% feladat: kiszamolni a megadott f alapján
% az AA,bb,cc-t

AA = [ ] ;
bb = [ ] ;
cc =  ;

f = @(x,y) x.^2 - 3*x.*y + 0.5*y.^2 + x + 10*y - 7 ;

fV = @(v) 0.5*v'*AA*v + bb'*v + cc ;
dfV =@(v) AA*v + bb ;
d2fV = @(v) AA

% a tartomany
xmin = -10 ; xmax = 10 ;
xb = linspace(xmin,xmax,50) ;
ymin = -10 ; ymax = 10 ;
yb = linspace(ymin,ymax,50) ;

% név
fname="kvadratikus mod" ;
pontok = [ -0.2 -2;   0 -0.9;  5 3 ]' ;
