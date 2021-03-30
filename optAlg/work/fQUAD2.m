function ret=fQUAD2()
  % név
  ret.name="kvadratikus 2" ;
  ret.numvar=2;
  
  % kvadratikus % neg definit
  AA = [ -8 6; ...
         6 -8] ;
  bb = [ 7 ; -3] ;
  cc = -1 ;

  ff = @(x,y) -4*x.^2 + 6*x.*y + -4*y.^2 + 7*x - 3*y -1 ;
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