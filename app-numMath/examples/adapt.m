function ret=adapt2(f, a,b, tab)
  m=0.5*(a+b);
  tam=(m-a)*0.5*(f(a)+f(m));
  tmb=(b-m)*0.5*(f(m)+f(b));
  ret=tam+tmb;
  if abs(ret-tab)>1e-9
    ret=adapt(f,a,m,tam);
    ret=ret+adapt(f,m,b,tmb);
  end
end