function ret=lsFMS()
  ret.name="fminsearch";
  ret.lsearch=@lsearch;
end


function [loc,val]=lsearch(fun,x0,p,a0)
  L=@(a) fun.f(x0+p*a);
  [loc, val, ~, ~] = fminsearch(L, a0) ;
end
