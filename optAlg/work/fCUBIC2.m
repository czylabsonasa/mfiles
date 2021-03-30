function ret=fCUBIC2()
  % név
  ret.name="nyújtott köbös" ;


  numvar=2 ;
  ret.numvar=numvar ;

  % nyújtott köbös
  ff = @(x,y) 10*x.^3 + y.^3 - 30*x - 3*y ;
  f = @(v) ff(v(1),v(2)) ;
  dffx = @(x,y) 30*x.^2-30 ;
  dffy = @(x,y) 3*y.^2-3 ;
  df =@(v) [dffx(v(1),v(2)) ; dffy(v(1),v(2)) ] ;
  % d2fV hianyzik
  d2ff=@(x,y) [60*x, 0; 0, 6*y] ;
  d2f=@(v) d2ff(v(1),v(2));

  ret.ff=ff ;
  ret.f=f ;
%   ret.dfx=dfx ;
%   ret.dfy=dfy ;
  ret.df=df ;
  ret.d2f=d2f;


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