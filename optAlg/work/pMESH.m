function pMESH(feladat,scale)
  fprintf("\n2d-rajzolás\n");

  
  ff=feladat.ff ;
  xb=feladat.xb ;
  yb=feladat.yb ;

  
  fprintf("%s\n",feladat.name);
  fprintf("\n") ;

  clf ;
  [X,Y] = meshgrid(xb, yb) ;
  meshc(X,Y,scale*ff(X,Y)) ;
  axis square ;

end
