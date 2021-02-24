function ret = regulafalsi2(conf)
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
    neval = neval + 2 ;
    it = it + 1 ;

    m = a-fa*(b-a)/(fb-fa) ;
    % M = a+b - m;
    fm = f(m) ;

    M = 0.5*(a+b) ;
    fM = f(M) ;
    if fm * fM < 0
      if M < m
        a = M ; fa = fM ;
        b = m ; fb = fm ;
      else
        a = m ; fa = fm ;
        b = M ; fb = fM ;
      end
      continue
    end
    
    % fprintf(stdout,'\n%.2f %.2f %.2f\n', a, m, b) ;
    % fprintf(stdout,'%.2f %.8f %.2f\n', fa, fm, fb) ;
    if abs(fm)<ftol
      break ;
    end

    if fa*fm < 0.0 
      b = m ; fb = fm ;
    else
      a = m ; fa = fm ;
    end

    % m = M ;
    % fm = f(m) ;
    % if fa*fm < 0.0
      % b = m ; fb = fm ;
    % else
      % a = m ; fa = fm ;
    % end
    

  end 

  if it>=maxit
    ret.status = 0 ;
  else
    ret.status = 1 ;
  end
  
  ret.loc = a-fa*(b-a)/(fb-fa) ;
  ret.val = conf.f(ret.loc) ; 
  ret.neval = neval + 1 ;
  ret.method = 'regulafalsi2' ;
  
end
