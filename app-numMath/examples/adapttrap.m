function [val,fevs] =adapttrap(f, a,b, fa, fb, epsi)
  if epsi<eps(1), epsi=eps(1); end
  m=0.5*(a+b);
  tab = (b-a)*0.5*(fa+fb) ;
  fm = f(m) ;
  tam=(m-a)*0.5*(fa+fm);
  tmb=(b-m)*0.5*(fm+fb);
  val=tam+tmb;
  fevs=1;
  d =abs(val-tab);
  if d/(1+abs(val))>epsi
    [v,fe]=adapttrap(f,a,m,fa,fm,0.5*epsi);
    val=v;
    fevs=fevs+fe;
    [v,fe]=adapttrap(f,m,b,fm,fb,0.5*epsi);
    val=val+v;
    fevs=fevs+fe;
  end
end