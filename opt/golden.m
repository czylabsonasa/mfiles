function ret = golden(conf)

  a = conf.a ;
  b = conf.b ;
  xtol = conf.xtol ;
  f = conf.f ;

  lambda = 0.5*(1.0+sqrt(5.0)) ;
  alfa = 1.0/(1.0+lambda) ;

  c = a + alfa*(b-a) ;
  fc = f(c) ;
  left = true ;
  neval = 1 ;
  while b-a>xtol
    % b-a
    neval = neval + 1 ;
    if true==left
      d = b - alfa*(b-a) ;
      fd = f(d) ;
    else
      c = a + alfa*(b-a) ;
      fc = f(c) ;
    end

    if fc < fd
      left = false ;
      b = d ;
      d = c ;
      fd = fc ;
    else
      left = true ;
      a = c ;
      c = d ;
      fc = fd ;
    end
%    fprintf(stdout, '%.3f %.3f %.3f %.3f\n',a,c,d,b) ;
  end 

  ret.status = 1 ;
  ret.loc = 0.5*(a+b) ;
  ret.val = conf.f(ret.loc) ;
  ret.neval = neval + 1 ; 
  ret.method = 'golden' ;
  
end
