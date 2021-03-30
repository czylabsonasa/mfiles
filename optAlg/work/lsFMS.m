function [loc, val] = lsFMS(f, x0)
  [loc, val, ~, ~] = fminsearch(f, x0) ;
end
