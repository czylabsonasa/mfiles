function ret = secant(conf)
  a = conf.a ; 
  b = conf.b ;
  f = conf.df ;
  xtol = conf.xtol ;
  ftol = conf.ftol ;
  maxit = conf.maxit ;
  
  fa = f(a) ;
  fb = f(b) ;
  neval = 2 ;
  
  it = 0 ;
  while abs(b-a) > xtol && it < maxit
    % m = a-fa*(b-a)/(fb-fa) ;
    m = (fb*a-fa*b)/(fb-fa) ;
    fm = f(m) ;
    % fprintf(stdout,'\n%.2f %.2f %.2f\n', a, m, b) ;
    % fprintf(stdout,'%.2f %.8f %.2f\n', fa, fm, fb) ;
    if abs(fm)<ftol
      break ;
    end

    if fa*fm <= 0.0
      b = m; fb = fm ;
    else
      a = b ; fa = fb ;
      b = m ; fb = fm ;
    end
    
    neval = neval + 1 ;
    it = it + 1 ;
  end 
  % it, b-a, fm
  
  if it>=maxit
    ret.status = 0 ;
  else
    ret.status = 1 ;
  end

  ret.loc = (fb*a-fa*b)/(fb-fa) ;
  ret.val = conf.f(ret.loc) ; 
  ret.neval = neval + 1 ;
  ret.method = 'secant' ;

  
end
