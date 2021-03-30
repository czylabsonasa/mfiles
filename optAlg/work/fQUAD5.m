function ret=fQUAD5()
  % név
  ret.name="kvadratikus 5" ;
  ret.numvar=2;
  
  % kvadratikus % neg def
  AA = [ -2 0; ...
         0 -4] ;
  bb = [ 0 ; 8] ;
  cc = 7 ;

  ff = @(x,y) -x.^2 + 2*x - 2*y.^2 + 8*y + 7 ;
  f = @(v) 0.5*v'*AA*v + bb'*v + cc ;
  df =@(v) AA*v + bb ;
  d2f = @(v) AA ;

  ret.ff=ff ;
  ret.f=f ;
  ret.df=df ;
  ret.d2f=d2f ;
  
  
  % a tartomany
  xmin = -10 ; 
  xmax = 10 ;
  xb = linspace(xmin,xmax,50) ;
  ymin = -10 ; 
  ymax = 10 ;
  yb = linspace(ymin,ymax,50) ;

  ret.xmin = xmin ; 
  ret.xmax = xmax ;
  ret.xb = xb ;
  ret.ymin = ymin ; 
  ret.ymax = ymax ;
  ret.yb=yb ;
  
end