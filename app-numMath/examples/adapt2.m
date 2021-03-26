function ret=adapt2(f, a,b, fa, fb)
  m=0.5*(a+b);
  tab = (b-a)*0.5*(fa+fb) ;
  fm = f(m) ;
  tam=(m-a)*0.5*(fa+fm);
  tmb=(b-m)*0.5*(fm+fb);
  ret=tam+tmb;
  if abs(ret-tab)>1e-9
    ret=adapt(f,a,m,fa,fm);
    ret=ret+adapt(f,m,b,fm,fb);
  end
end