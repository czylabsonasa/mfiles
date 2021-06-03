function mexpand(a, b, step)
% myexpand(a,b,step)                                                             
% A highly ineffective and unreliable binary expander
% The fraction a/b will be expanded to step binary digits
% 
% Usage:
% >> myexpand(1,3,10)
%
%                             1 / 3 = 0.0101010101
%
  if a/b>=1, disp('error. a should be less than .'); return; end
  fprintf('\n\t%d / %d = 0.', a, b) ;

  for it = 1:step
    a = a * 2 ;
    if a < b
      fprintf('0') ;
    else
      a = a -b;
      fprintf('1') ;
    end
  end
  fprintf('\n\n') ;
end