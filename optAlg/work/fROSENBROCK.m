% pl x0=(1.1 -0.8) nagyon rossz a grad-okra
function ret=fROSENBROCK()
  % név
  ret.name="Rosenbrock" ;

  numvar=2 ;
  ret.numvar=numvar ;


  ff = @(x,y) 100*(y-x.^2).^2 + (1-x).^2 ;
  f = @(v) ff(v(1),v(2)) ;

  % hoppá: itt benne maradt egy négyzet!!! (marc3 ora)
  dffx = @(x,y) -400*x.*(y-x.^2) + 2*(x-1) ; 
  dffy = @(x,y) 200*(y-x.^2) ;

  df =@(v) [dffx(v(1),v(2)) ; dffy(v(1),v(2)) ] ;
  d2f = @(v) [ 1200*v(1)^2-400*v(2)+2, -400*v(1) ; -400*v(1), 200] ;

  ret.ff=ff ;
  ret.f=f ;
%   ret.dfx=dfx ; % ezeket nem nagyon hasznaljuk kulon
%   ret.dfy=dfy ;
  ret.df=df ;
  ret.d2f=d2f ;
  
  
  
  % a tartomany
  xmin = -2.5 ; 
  xmax = 2 ;
  xb = linspace(xmin,xmax,50) ;
  ymin = -4.5 ; 
  ymax = 4 ;
  yb = linspace(ymin,ymax,50) ;

  ret.xmin = xmin ; 
  ret.xmax = xmax ;
  ret.xb = xb ;
  ret.ymin = ymin ; 
  ret.ymax = ymax ;
  ret.yb=yb ;
  
end