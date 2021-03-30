function xx=uFMS(feladat,x0)
  fprintf("módszer=fminsearch\n");

  [loc, val, flg, out] = fminsearch(feladat.f, x0) ;


  if 1.0==flg
    flag="ok"; 
  else
    flag="other"; 
  end

  xx=[x0,loc];

  hRESULT(feladat,flag,out.iterations,xx);

end
