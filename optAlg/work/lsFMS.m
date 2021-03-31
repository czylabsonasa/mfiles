function [loc,val]=lsFMS(f,df,x0,p,a0)
  L=@(a) f(x0+p*a);
  [loc, val, ~, ~] = fminsearch(L, a0) ;
end
