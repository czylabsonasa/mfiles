function L=mchol(A)
% 
% Cholesky-decomposition
% Only for playing with small integer matrices.
% 
  L = tril(A) ;
  s = size(L) ;
  r = s(1) ;
  mprint('\nphase 0:\n',L) ;
  for i=1:r
    fprintf('\nphase %d:\n', i) ;
    fprintf('\n  %d,%d --> ',i,i) ;
    % diagonal entry
    s = L(i,1:i-1)*L(i,1:i-1)'; 
    L(i,i) = L(i,i)- s ;
    if L(i,i)<=0
      mprint('  not a positive definite matrix\n', [])
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
    mprint('',L) ;
  end
end
