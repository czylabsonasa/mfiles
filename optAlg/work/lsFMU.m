function [loc,val]=lsFMU(f,df,x0,p,a0)
  L=@(a) f(x0+p*a);
  [loc, val, ~, ~] = fminunc(L, a0, optimoptions('fminunc','Display','none') ) ;
end
