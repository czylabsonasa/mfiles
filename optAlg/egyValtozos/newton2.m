function ret = newton2(conf)
  x0 = conf.x0 ; 
  xtol = conf.xtol ;
  maxit = conf.maxit ;
  f = conf.df ;
  delta = 0.01 ;
  df = @(x,h) 0.5*(f(x+h)-f(x-h))/h ;
  
  neval = 0 ;
  it = 0 ; 
  while it<maxit
    neval = neval + 3 ;
    it = it + 1 ;

    x1 = x0 - f(x0)/df(x0,delta);
    if abs(x1-x0)<xtol
      ret.status = 1 ;
      x0 = x1 ;
      break ;
    end
    delta=min(delta,0.5*abs(x1-x0)) ;
    x0 = x1 ;

  end 

  if it>=maxit
    ret.status = -1 ;
    ret.dstatus = "maxit" ;
  end  
  ret.loc = x0 ;
  ret.val = conf.f(x0) ;
  ret.neval = neval + 1 ; 
  ret.method = "newton2" ;
  
end
