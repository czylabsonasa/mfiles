function ret=mycubic1()
  % név
  ret.fname="köbös" ;

  numvar=2 ;
  ret.numvar=numvar ;

  % fuggvenyes resz
  f = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;
  fV = @(v) f(v(1),v(2)) ;
  dfx = @(x,y) 3*x.^2-3 ;
  dfy = @(x,y) 3*y.^2-3 ;
  dfV =@(v) [dfx(v(1),v(2)) ; dfy(v(1),v(2)) ] ;
  % ide meg kellene a d2fv is
  
  ret.f=f ;
  ret.fV=fV ;
%   ret.dfx=dfx ; % ezeket nem nagyon hasznaljuk kulon
%   ret.dfy=dfy ;
  ret.dfV=dfV ;
  
  % a tartomany
  xmin = -2 ;
  xmax = 2 ;
  xb = linspace(xmin,xmax,50) ;
  ymin = -2 ;
  ymax = 2 ;
  yb = linspace(ymin,ymax,50) ;  

  ret.xmin = xmin ; 
  ret.xmax = xmax ;
  ret.xb = xb ;
  ret.ymin = ymin ; 
  ret.ymax = ymax ;
  ret.yb=yb ;

end
