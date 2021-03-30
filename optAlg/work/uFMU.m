function xx=uFMU(feladat,x0)

  fprintf("módszer=fminunc\n");
  [loc, val, flg, out] = fminunc(feladat.f, x0, optimoptions('fminunc','Display','none') ) ;

  if 1.0==flg
    flag="ok"; 
  else
    flag="other"; 
  end

  xx=[x0,loc];

  hRESULT(feladat,flag,out.iterations,xx);
  
end
