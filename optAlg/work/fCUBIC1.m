function ret=fCUBIC1()
  % név
  ret.name="köbös" ;

  numvar=2 ;
  ret.numvar=numvar ;

  % fuggvenyes resz
  ff = @(x,y) x.^3 + y.^3 - 3*x - 3*y ;
  f = @(v) ff(v(1),v(2)) ;
  dfx = @(x,y) 3*x.^2-3 ;
  dfy = @(x,y) 3*y.^2-3 ;
  df =@(v) [dfx(v(1),v(2)) ; dfy(v(1),v(2)) ] ;
  % ide meg kellene a d2fv is
%  dfxx=@(x,y) 6*x;
%  dfxy=@(x,y) 0;
%  dfyx=@(x,y) 0;
%  dfxx=@(x,y) 6*x;
  d2ff=@(x,y) [6*x, 0; 0, 6*y];
  d2f=@(v) d2ff(v(1),v(2));     



  ret.ff=ff ;
  ret.f=f ;
  ret.df=df ;
  ret.d2f=d2f;  

  % a tartomany melyen a mesh-t rajzoljuk
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
