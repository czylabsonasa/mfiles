function L=mychol(A)
% 
% Cholesky-decomposition
% A detailed version of choldec1
% Only for playing with small integer matrices.
% 
  L = tril(A) ;
  s = size(L) ;
  r = s(1) ;
  myprint('\nphase 0:\n',L) ;
  for i=1:r
    fprintf('\nphase %d:\n', i) ;
    fprintf('\n  %d,%d --> ',i,i) ;
    % comp of diagonal of L
    s = L(i,1:i-1)*L(i,1:i-1)'; 
    L(i,i) = L(i,i)- s ;
    if L(i,i)<=0
      myprint('  not a positive definite matrix\n', [])
      return ;
    end
    L(i,i)=sqrt(L(i,i)) ;
    p = L(i,i) ;
    %fprintf('  %.2f\n',p) ; % for integers!
    for j=(i+1):r
      fprintf('  %d,%d --> ',j,i) ;
      s = L(i,1:(i-1))*L(j,1:(i-1))';
      L(j,i) = (L(j,i)-s)/p ;
      %fprintf('  %.2f\n',L(j,i)) ;
    end
    myprint('',L) ;
  end
end
