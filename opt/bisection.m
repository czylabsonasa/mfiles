function ret = bisection(conf)
  a = conf.a ; 
  b = conf.b ;
  f = conf.df ;
  xtol = conf.xtol ;

  fa = f(a) ;
  fb = f(b) ;
  neval = 2 ;
  if fa * fb > 0.0
    ret.status = -1 ;
    ret.dstatus = 'wrong initial interval' ;
    return ;
  end
  
  while b-a > xtol
%    fprintf('\n%.3f %.3f\n',a,b) ;
%    fprintf('%.3f %.3f\n',fa,fb) ;
    
    m = 0.5*(a+b) ;
    fm = f(m) ;
    if fa*fm <= 0.0   % < :problema volt a fun3-mal
      b = m ; fb = fm ;
    else
      a = m ; fa = fm ;
    end

    neval = neval + 1 ;
  end 

  ret.status = 1 ;
  ret.loc = 0.5*(a + b) ;
  ret.val = conf.f(ret.loc) ; 
  ret.neval = neval + 1 ;
  ret.method = 'bisection' ;
end
