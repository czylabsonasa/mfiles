function ret = exhaustive(conf)
  
  x = linspace(conf.a, conf.b, conf.npts) ;
  [val,ival] = min(conf.f(x)) ;
  loc = x(ival) ;

  ret.status = 1 ;
  ret.val = val ;
  ret.loc = loc ;
  ret.neval = conf.npts ;
  ret.method = "exhaustive" ;

end
