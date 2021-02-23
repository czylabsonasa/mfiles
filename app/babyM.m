function [x, lep] = babyM(a, x, ke=1e-9, maxit=33 )
  lep = 0 ;
  while true
    lep = lep + 1 ;
    if lep > maxit
      lep = -1 ;
      return 
    end
    ux = 0.5*( x + a / x ) 
    if abs( x - ux ) < ke 
      x = ux ;
      return 
    end
    x = ux ; 
  end
end