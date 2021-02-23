% a derivalt zerushelye, 
% nem hasznal derivaltat csak kozelitest

function ret = bisection2(inp)
  a = inp.a ; 
  b = inp.b ;
  xtol = inp.xtol ;
  f = inp.f ;

  delta = 0.01 * (b-a) ;
  df = @(x,h) 0.5*(f(x+h)-f(x-h))/h ;
  fa = df(a, delta) ;
  fb = df(b, delta) ;

  neval = 4 ;
  if fa * fb > 0.0
    ret.status = -1 ;
    ret.dstatus = 'wrong initial interval'
    return ;
  end
  
  while b-a > xtol
    m = 0.5*(a+b) ;
    delta = 0.5*delta ;
    fm = df(m, delta) ;
    if fa*fm <= 0.0 
      b = m ; fb = fm ;
    else
      a = m ; fa = fm ;
    end

    neval = neval+2 ;
  end 

  ret.status = 1 ;
  ret.loc = 0.5*(a + b) ;
  ret.val = inp.f(ret.loc) ; 
  ret.neval = neval+1 ;
  ret.method = 'bisection2' ;
end

