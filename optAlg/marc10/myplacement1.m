function ret=myplacement1(pontok)
  % név
  ret.fname="2d-elhelyezés - minimális össztávolság" ;

  numvar=2 ;
  ret.numvar=numvar ;
  

  % fuggvenyes resz
  f = @(x,y) 1;
  fV = @(v) [1;1] ;
  dfx = @(x,y) 1 ;
  dfy = @(x,y) 1 ;
  dfV =@(v) [1 1; 1 1] ;
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

function val=pref(x,y,pontok)
