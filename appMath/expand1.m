function expand1(x, d, step)
% expand1(x,d,step)                                                             
% A highly ineffective and unreliable binary expander
% The number 'x'<1 with 'd' decimal digits will be expanded to 'step' binary digits
% 
% Usage:
% >> expand1(0.333,3,4)
% 
%                             0 | 333
%                             ------------
%                             0 | 666
%                             1 | 332
%                             0 | 664
%                             1 | 328
%

  if x>=1, disp('error. x should be less than 1.'); return; end
  M = 10^d ;
  x = floor(M*x) ;
  fprintf('\n\t0 | %0*d\n', d, x) ;
  fprintf('\t%s\n', repelem('-',4*d)) ;

  for it = 1:step
    x = x * 2 ;
    if x<M
      fprintf('\t0 | %0*d\n', d, x) ;
    else
      x = x -M ;
      fprintf('\t1 | %0*d\n', d, x) ;
    end
  end
  fprintf('\n') ;
end
