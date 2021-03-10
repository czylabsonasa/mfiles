function csakrajz(feladat,scale)
  fprintf("\nrajzolás\n");

  
  fname=feladat.fname ;
  numvar=feladat.numvar;
  f=feladat.f ;
  fV=feladat.fV ;
  xb=feladat.xb ;
  yb=feladat.yb ;

  
  fprintf("%s\n",fname);
  fprintf("\n") ;

  clf ;
  [X,Y] = meshgrid(xb, yb) ;
  meshc(X,Y,scale*f(X,Y)) ;
  axis equal ;

end
