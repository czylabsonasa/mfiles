% ?
function [loc,val]=lsFMB(f,a0)
  [loc, val, ~, ~] = fminbnd(f, 0, a0) ;
end
