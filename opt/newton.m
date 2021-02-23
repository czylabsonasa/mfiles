function ret = newton(conf)
  x0 = conf.x0 ; 
  xtol = conf.xtol ;
  maxit = conf.maxit ;
  f = conf.df ;
  df = conf.ddf ;
  
  neval = 0 ;
  it = 0 ; 
  while it<maxit
    neval = neval + 2 ;
    it = it + 1 ;

    x1 = x0 - f(x0)/df(x0);
    if abs(x1-x0)<xtol
      ret.status = 1 ;
      x0 = x1 ;
      break ;
    end
    x0 = x1 ;

  end 

  if it>=maxit
    ret.status = -1 ;
    ret.dstatus = "maxit" ;
  end  
  ret.loc = x0 ;
  ret.val = conf.f(x0) ;
  ret.neval = neval + 1 ; 
  ret.method = "newton" ;  
end
