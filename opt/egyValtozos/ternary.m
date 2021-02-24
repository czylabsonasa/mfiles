function ret = ternary(conf)

  a = conf.a ;
  b = conf.b ;
  xtol = conf.xtol ;
  f = conf.f ;

  alfa1 = 1.0 / 3.0 ;
  alfa2 = 2.0 / 3.0 ;

  neval = 1 ;
  while b-a>xtol
    % b-a
    neval = neval + 2 ;
    c = a + alfa1*(b-a) ;
    d = a + alfa2*(b-a) ;
    fc = f(c) ;
    fd = f(d) ;

    if fc < fd
      b = d ;
    else
      a = c ;
    end
%    fprintf(stdout, '%.3f %.3f %.3f %.3f\n',a,c,d,b) ;
  end 

  ret.status = 1 ;
  ret.loc = 0.5*(a+b) ;
  ret.val = conf.f(ret.loc) ;
  ret.neval = neval + 1 ; 
  ret.method = 'ternary' ;
  
end
