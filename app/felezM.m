function [m, lep] = felezM(f, a, b, ke=1e-9, maxit=33 )
  lep=0
  fa = f( a ); fb = f( b ) ;
  while b-a > ke
    m = 0.5*( a + b ) ;
    lep = lep + 1 ;
    if lep > maxit
      lep = -1;
      return 
    end
    fm = f( m ) ;
    if abs( fm ) < ke return end 
    if fm  * fa < 0
      b = m ;
      fb = fm ;
    else 
      a = m ;
      fa = fm ;
    end

  end

end