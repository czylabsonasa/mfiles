function myFMU(feladat,pt0,stopcond)

  fprintf("fminunc\n");

  fname=feladat.fname ;
  numvar=feladat.numvar;
  f=feladat.f ;
  fV=feladat.fV ;
  dfV=feladat.dfV ;
  xb=feladat.xb ;
  yb=feladat.yb ;

  if pt0(1)<feladat.xmin || pt0(1) > feladat.xmax ||...
      pt0(2)<feladat.ymin || pt0(2) > feladat.ymax
    fprintf('a kezdőpont nincs benne a tartományban\n\n') ;
    return ;
  end
  
  fprintf("%s\n",fname);
  fprintf("x0=(%.3f,%.3f)\n", pt0(1), pt0(2)) ;
  [loc, val, flag, out] = fminunc(fV, pt0, optimoptions('fminunc','Display','none') ) ;
  fprintf("flag=%d nstep=%d funcCount=%d\n", flag, out.iterations, out.funcCount ) ;
  fprintf("x=(%.3f,%.3f)    fx=%.3f    |dfx|=%.3f\n", loc(1), loc(2), fV(loc), norm(dfV(loc))) ;
  fprintf("##################\n")

  
end
