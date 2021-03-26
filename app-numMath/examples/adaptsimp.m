function [val,fevs] =adaptsimp(f, a,m,b, fa, fm,fb, epsi)
  if epsi<eps(1), epsi=eps(1); end
  tab=(b-a)*(fa+4*fm+fb)/6 ;
  
  am=0.5*(a+m);
  fam=f(am);
  tam=(m-a)*(fa+4*fam+fm)/6 ;
  
  mb=0.5*(m+b);
  fmb = f(mb);
  tmb = (b-m)*(fm+4*fmb+fb)/6 ;

  val=tam+tmb;
  fevs=2;
  d =abs(val-tab);
  if d/(1+abs(val))>epsi
    [v,fe]=adaptsimp(f,a,am,m,fa,fam,fm,0.5*epsi);
    val=v;
    fevs=fevs+fe;
    [v,fe]=adaptsimp(f,m,mb,b,fm,fmb,fb,0.5*epsi);
    val=val+v;
    fevs=fevs+fe;
  end
end