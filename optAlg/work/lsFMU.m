function [loc,val]=lsFMU(f,x0)
  [loc, val, ~, ~] = fminunc(f, x0, optimoptions('fminunc','Display','none') ) ;
end
