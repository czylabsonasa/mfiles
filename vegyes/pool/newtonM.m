function [x, lep] = newtonM(f, df, x, ke=1e-9, maxit=33 )
  lep=0;
  while true
    lep = lep + 1 ;
    if lep > maxit
      lep = -1;
      return 
    end
    xx = 2*f(x)/df(x) ;
    if abs( xx ) < ke 
      x = x - xx ;
      return 
    end
    x = x - xx 
  end

end