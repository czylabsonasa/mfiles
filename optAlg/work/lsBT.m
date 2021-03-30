function [loc, val] = lsBT(f, a0)
  % x0 is ignored
  a1=a0;
  f1=f(a1);
  f0=f(0);
  while f1>=f0
    a1=a1*0.5;
    f1=f(a1);
  end
  % f0 > f1
  a2=0.5*a1;
  f2=f(a2);
  while f2<f1
    a1=a2;
    f1=f2;
    a2=0.5*a1;
    f2=f(a2);
  end


  loc=a1;val=f1;
end
