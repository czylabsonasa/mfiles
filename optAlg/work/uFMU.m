function xx=uFMU(fun,x0)

  fprintf("módszer=fminunc\n");
  [loc, val, flg, out] = fminunc(fun.f, x0, optimoptions('fminunc','Display','none') ) ;

  if 1.0==flg
    flag="ok"; 
  else
    flag="other"; 
  end

  xx=[x0,loc];

  hRESULT(fun,flag,out.iterations,xx);
  
end
