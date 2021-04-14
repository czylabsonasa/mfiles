function ret=lsARM()
  ret.name="Armijo";
  ret.lsearch=@lsearch;
end


function [loc,val]=lsearch(fun,x0,p,a0)
  f=fun.f;
  df=fun.df;
  alfa = a0 ; % alfa0
  c1 = 0.1 ; % c1
  ro = 0.9 ; % rho
  L0=f(x0); d=dot(df(x0),p) ;
  L=@(a) f(x0+p*a);

  while L(alfa) > L0+alfa*c1*d
    alfa = alfa*ro ;
  end
  loc=alfa; val=f(x0+alfa*p);
end