function gausselim1(A)
% 
% Gauss-elimination without swap on matrix A.
% Only for playing with small integer matrices.
% 
  s = size(A) ;
  r = s(1) ;
  c = s(2) ;
  fprintf('\nphase 0:\n') ;
  printout(A) ;
  for i=1:r-1
    fprintf('\nphase %d:\n', i) ;
    if abs(A(i,i))==0
      if any(abs(A(i+1:end,i))>0)
        fprintf('no way w/0 swap...exiting...');
        return ;
      else
        fprintf('no need to eliminate. goto the next phase.');
        continue ;
      end
    end
    p = 1.0/A(i,i) ;
    for j=(i+1):r
      A(j,:) = A(j,:) -p*A(j,i)*A(i,:) ;
    end
    printout(A) ;
  end
end

function printout(A)
  s = size(A) ;
  r = s(1) ;
  c = s(2) ;
  C=cell(r,c) ;
  mx = 0 ; % max len of rat form
  for i=1:r
    for j=1:c
      C{i,j}=strtrim(rats(A(i,j))) ;
    end
  end
  CC=pad(C,'left') ;
  for i=1:r
    for j=1:c
      fprintf('  %s',CC{i,j}) ;
    end
    fprintf('\n') ;
  end
end
