function ret=myquad5()
  % név
  ret.fname="kvadratikus 5" ;
  ret.numvar=2;
  
  % kvadratikus % neg def
  AA = [ -2 0; ...
         0 -4] ;
  bb = [ 0 ; 8] ;
  cc = 7 ;

  f = @(x,y) -x.^2 + 2*x - 2*y.^2 + 8*y + 7 ;
  fV = @(v) 0.5*v'*AA*v + bb'*v + cc ;
  dfV =@(v) AA*v + bb ;
  d2fV = @(v) AA ;

  ret.f=f ;
  ret.fV=fV ;
  ret.dfV=dfV ;
  ret.d2fV=d2fV ;
  
  
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