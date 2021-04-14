function xx=uFMS(fun,x0)
  fprintf("módszer=fminsearch\n");

  [loc, val, flg, out] = fminsearch(fun.f, x0) ;


  if 1.0==flg
    flag="ok"; 
  else
    flag="other"; 
  end

  xx=[x0,loc];

  hRESULT(fun,flag,out.iterations,xx);

end
