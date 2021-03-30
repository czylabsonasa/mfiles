function [loc,val]=lsFMS(f,a0)
  [loc, val, ~, ~] = fminsearch(f, a0) ;
end
