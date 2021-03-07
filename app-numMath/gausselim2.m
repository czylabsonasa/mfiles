function gausselim2(A)
% 
% a detailed version of gausselim1
% 
  s = size(A) ;
  r = s(1) ;
  c = s(2) ;
  fprintf('\nphase 0:\n') ;
  printout(A) ;
  paktc() ;
  for i=1:r-1
    fprintf('\nphase %d:\n', i) ;
    if abs(A(i,i))==0
      if any(abs(A(i+1:end,i))>0)
        fprintf('\n  no way w/o swap...exiting...\n');
        paktc() ;
        break ;
      else
        fprintf('\n  no need to eliminate\n');
        paktc() ;
        continue ;
      end
    end
    p = 1.0/A(i,i) ;
    for j=(i+1):r
      fprintf('\n  sub-phase %d:\n', j) ;
      lji = p*A(j,i) ;
      if abs(lji)>0
        A(j,:) = A(j,:) - lji*A(i,:) ;
        A(j,i)=0 ;

        fprintf('\n    subtract %s times the %d. row from the %d. row\n', strtrim(rats(lji)), i, j);
        printout(A) ;
      else
        fprintf('\n    nothing to eliminate\n');
      end
      
      paktc() ;
    end
  end
end
