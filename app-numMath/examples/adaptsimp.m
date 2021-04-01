% the user communicates with this one:
function [val,fevs] =adaptsimp(f, a,b,epsi)
  m=0.5*(a+b);
  [val,fevs]=adaptsimpH(f,a,m,b,f(a),f(m),f(b),epsi);
end

% a worker function
function [val,fevs] =adaptsimpH(f, a,m,b, fa, fm,fb, epsi)
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
    [v,fe]=adaptsimpH(f,a,am,m,fa,fam,fm,0.5*epsi);
    val=v;
    fevs=fevs+fe;
    [v,fe]=adaptsimpH(f,m,mb,b,fm,fmb,fb,0.5*epsi);
    val=val+v;
    fevs=fevs+fe;
  end
end