function ret=myquad4()
  % név
  ret.fname="kvadratikus 4" ;
  ret.numvar=2;
  
  % kvadratikus % poz szemi definit
  AA = [ 0 6; ...
         6 36] ;
  bb = [ 7 ; -3] ;
  cc = -1 ;

  f = @(x,y) 6*x.*y + 72*y.^2 + 7*x - 3*y -1 ;
  fV = @(v) 0.5*v'*AA*v + bb'*v + cc ;
  dfV =@(v) AA*v + bb ;
  d2fV = @(v) AA ;

  ret.f=f ;
  ret.fV=fV ;
  ret.dfV=dfV ;
  ret.d2fV=d2fV ;
  
  
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