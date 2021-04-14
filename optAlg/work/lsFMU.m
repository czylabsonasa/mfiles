function ret=lsFMU()
  ret.name="fminunc";
  ret.lsearch=@lsearch;
end


function [loc,val]=lsearch(fun,x0,p,a0)
  L=@(a) fun.f(x0+p*a);
  [loc, val, ~, ~] = fminunc(L, a0, optimoptions('fminunc','Display','none') ) ;
end
