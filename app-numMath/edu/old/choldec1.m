function L=choldec1(A)
% 
% Cholesky-decomposition
% Only for playing with small integer matrices.
% 
  L = tril(A) ;
  s = size(L) ;
  r = s(1) ;
  fprintf('\nphase 0:\n') ;
  printout(L) ;
  paktc() ;
  for i=1:r
    fprintf('\nphase %d:\n', i) ;
    % comp of diagonal of L
    s = L(i,1:i-1)*L(i,1:i-1)'; 
    L(i,i) = L(i,i)- s ;
    if L(i,i)<=0
      fprintf('\n  not a positive definite matrix\n');
      paktc() ;
      break ;
    end
    L(i,i)=sqrt(L(i,i)) ;
    p = L(i,i) ;
    for j=(i+1):r
      s = L(i,1:(i-1))*L(j,1:(i-1))';
      L(j,i) = (L(j,i)-s)/p ;
    end
    printout(L) ;
    paktc() ;
  end

end
