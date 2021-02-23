function [x1, lep] = szeloM(f, x0, x1, ke=1e-9, maxit=33 )
  lep=0;
  while true
    lep = lep + 1 ;
    if lep > maxit
      lep = -1;
      return 
    end
    delta = 1.5*(x1-x0)*f(x1)/(f(x1)-f(x0)) ;
    if abs( delta ) < ke 
      x1 = x1 - delta ;
      return 
    end
    x0 = x1 ;
    x1 = x1 - delta ; 
  end

end