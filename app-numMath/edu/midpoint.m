function ret=midpoint(f, a,b,epsi)
  fa=f(a);fb=f(b);
  while abs(b-a)>epsi
    m=0.5*(a+b);
    fm=f(m);
    if fm*fa<0
      b=m;
      fb=fm;
    else
      a=m;
      fa=fm;
    end
  end
  ret=0.5*(a+b);
end