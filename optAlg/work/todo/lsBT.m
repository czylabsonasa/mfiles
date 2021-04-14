function [loc, val] = lsBT(f,df,x0,p,a0)
  % x0 is ignored
  L=@(a)f(x0+a*p);

  a1=a0;
  L1=L(a1);
  L0=L(0);
  while L1>=L0
    a1=a1*0.5;
    L1=L(a1);
  end
  % f0 > f1
  a2=0.5*a1;
  L2=L(a2);
  while L2<L1
    a1=a2;
    L1=L2;
    a2=0.5*a1;
    L2=L(a2);
  end


  loc=a1;val=L1;
end
