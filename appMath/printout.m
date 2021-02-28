function printout(A)
  s = size(A) ;
  r = s(1) ;
  c = s(2) ;
  C=cell(r,c) ;
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
