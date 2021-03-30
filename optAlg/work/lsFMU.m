function [loc,val]=lsFMU(f,a0)
  [loc, val, ~, ~] = fminunc(f, a0, optimoptions('fminunc','Display','none') ) ;
end
