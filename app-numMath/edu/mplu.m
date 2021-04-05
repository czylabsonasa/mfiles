function [P,L,U]=mplu(A)
% gaussian elimination with swap
% swap: only if neccessary and with the first 'good' row
% (it is not the partial pivoting)
% PLU  
% the P is printed as a row vector, but returned as a matrix
% 

  U = A ; % copy - not a reference
  s = size(U) ;
  r = s(1) ;
  c = s(2) ;
  perm = (1:r)' ;

  if not(r == c ) 
    mprint('A must be square',[]) ;
    return ;
  end
  L = eye(r,r) ;

  mprint('\nphase 0:\n', [perm,L,U]) ;
  for i=1:r-1
    nz = find(U(i+1:end,i) ) ;
    if length(nz)<1
      mprint('\n  pre-phase: no need to eliminate\n', [] )
      continue ;
    end
    
    fprintf('\nphase %d:\n', i) ;
    if abs(U(i,i))==0
      j = i+nz(1) ;
      mprint(sprintf('\n  pre-phase: swap the %d. row with the %d. row\n', i, j), []);
      perm([i,j]) = perm([j,i]) ;
      U([i,j],:) = U([j,i],:) ;
      L([i,j],1:i-1) = L([j,i],1:i-1) ;
    end
    
    mprint('',[perm,L,U]) ;
    
    p = 1.0/U(i,i) ;
    for j=(i+1):r
      fprintf('\n  sub-phase %d/%d:\n', i, j) ;
      lji = p*U(j,i) ;
      L(j,i)=lji ;
      if abs(lji)>0
        U(j,:) = U(j,:) - lji*U(i,:) ;
        U(j,i)=0 ;
  
        mprint(sprintf('\n    subtract %s times the %d. row from the %d. row\n', strtrim(rats(lji)), i, j),...
          [perm,L,U]) ;
      else
        mprint('\n    nothing to eliminate\n', []);
      end
    end
  end
  P = eye(r) ;
  P = P(:,perm) ;
  
end
