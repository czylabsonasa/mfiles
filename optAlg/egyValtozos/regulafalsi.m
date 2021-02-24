function ret = regulafalsi(conf)
  a = conf.a ; 
  b = conf.b ;
  f = conf.df ;
  xtol = conf.xtol ;
  ftol = conf.ftol ;
  maxit = conf.maxit ;
  
  fa = f(a) ;
  fb = f(b) ;
  neval = 2 ;
  if fa * fb > 0.0
    ret.status = -1 ;
    ret.dstatus = 'wrong initial interval'
    return ;
  end
  
  it = 0 ;
  while b-a > xtol && it < maxit
    m = a-fa*(b-a)/(fb-fa) ;
    fm = f(m) ;
    fprintf('\n%.2f %.2f %.2f\n', a, m, b) ;
    fprintf('%.2f %.8f %.2f\n', fa, fm, fb) ;
    if abs(fm)<ftol
      break ;
    end

    if fa*fm < 0.0 
      b = m ; fb = fm ;
    else
      a = m ; fa = fm ;
    end

    neval = neval + 1 ;
    it = it + 1 ;
  end 

  if it>=maxit
    ret.status = 0 ;
  else
    ret.status = 1 ;
  end
  
  ret.loc = a-fa*(b-a)/(fb-fa) ;
  ret.val = conf.f(ret.loc) ; 
  ret.neval = neval + 1 ;
  ret.method = 'regulafalsi' ;
  
end
