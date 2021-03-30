function ret=fQUAD1()
  % név
  ret.name="kvadratikus 1" ;
  ret.numvar=2;
  
  % kvadratikus % poz definit
  AA = [ 8 6; ...
         6 8] ;
  bb = [ 7 ; -3] ;
  cc = -1 ;

  ff = @(x,y) 4*x.^2 + 6*x.*y + 4*y.^2 + 7*x - 3*y -1 ;
  f = @(v) 0.5*v'*AA*v + bb'*v + cc ;
  df =@(v) AA*v + bb ;
  d2f = @(v) AA ;

  ret.ff=ff ;
  ret.f=f ;
  ret.df=df ;
  ret.d2f=d2f ;
  
  
  % a tartomany
  xmin = -8 ; 
  xmax = 3 ;
  xb = linspace(xmin,xmax,50) ;
  ymin = -3 ; 
  ymax = 8 ;
  yb = linspace(ymin,ymax,50) ;

  ret.xmin = xmin ; 
  ret.xmax = xmax ;
  ret.xb = xb ;
  ret.ymin = ymin ; 
  ret.ymax = ymax ;
  ret.yb=yb ;
  
end