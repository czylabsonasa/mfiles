function ret=fQUAD4()
  % név
  ret.name="kvadratikus 4" ;
  ret.numvar=2;
  
  % kvadratikus % poz szemi definit
  AA = [ 0 6; ...
         6 36] ;
  bb = [ 7 ; -3] ;
  cc = -1 ;

  ff = @(x,y) 6*x.*y + 72*y.^2 + 7*x - 3*y -1 ;
  f = @(v) 0.5*v'*AA*v + bb'*v + cc ;
  df =@(v) AA*v + bb ;
  d2f = @(v) AA ;

  ret.ff=ff ;
  ret.f=f ;
  ret.df=df ;
  ret.d2f=d2f ;
  
  
  % a tartomany
  xmin = -50 ; 
  xmax = 0 ;
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