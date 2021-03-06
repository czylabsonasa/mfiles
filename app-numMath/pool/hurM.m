function [m, lep] = hurM(f, a, b, ke=1e-9, maxit=33 )
  lep=0;
  fa = f(a) ;
  fb = f(b) ;
  while b - a > ke
    lep = lep + 1 ;
    if lep > maxit
      lep = -1;
      return 
    end
    m = a - fa * (a-b) / (fa-fb) ;
    fm = f(m) ;
    if abs( fm ) < ke 
      return 
    end
    if fm * fa < 0 
      b = m ;
      fb = fm ;
    else
      a = m ;
      fa = fm ;
    end
  end
  m = 0.5*(a + b) ;
end