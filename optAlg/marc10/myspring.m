% Arora konyv peldaja 
function ret=myspring()
  % név
  ret.fname="spring system" ;

  numvar=2 ;
  ret.numvar=numvar ;


  f = @(x,y) 100*(sqrt(x.^2+ (y.^2+1).^2)-1).^2 + 90*(sqrt(x.^2+ (y.^2-1).^2)-1).^2-20*x-40*y ;
  fV = @(v) f(v(1),v(2)) ;

  % feladat
  dfV =@(v) [1 ; 1] ;
  d2fV = @(v) [ 1 1 ; 1 1] ;

  ret.f=f ;
  ret.fV=fV ;
%   ret.dfx=dfx ; % ezeket nem nagyon hasznaljuk kulon
%   ret.dfy=dfy ;
  ret.dfV=dfV ;
  ret.d2fV=d2fV ;
  
  
  
  % a tartomany
  xmin = -1 ; 
  xmax = 1 ;
  xb = linspace(xmin,xmax,30) ;
  ymin = -1 ; 
  ymax = 1 ;
  yb = linspace(ymin,ymax,30) ;

  ret.xmin = xmin ; 
  ret.xmax = xmax ;
  ret.xb = xb ;
  ret.ymin = ymin ; 
  ret.ymax = ymax ;
  ret.yb=yb ;
  
end