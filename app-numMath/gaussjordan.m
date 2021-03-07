function iA=gaussplu(A)
% inverse through Gauss-Jordan elimination
% returns an empty matrix in case of no inverse

  iA = zeros(0) ; 
  s = size(A) ;
  r = s(1) ;
  c = s(2) ;

  if not(r == c ) 
    fprintf('A must be square') ;
    return ;
  end
  W = [A, eye(r,r)] ; % the 'W'ork
  succ=1;
  
  fprintf('\nforward elimination\n') ;  
  fprintf('\nphase 0:\n') ;
  printout(W) ;
  for i=1:r
    nz = find(W(i+1:end,i) ) ;
        
    fprintf('\nphase %d:\n', i) ;
    if abs(W(i,i))==0
      if length(nz)<1
        fprintf('\n  no inverse. exit');
        succ=0;
        break;
      end
      j = i+nz(1) ;
      fprintf('\n  pre-phase: swap with the %d. row\n', j);
      W([i,j],:) = W([j,i],:) ;
    end
    
    printout(W) ;
    
    p = 1.0/W(i,i) ;
    for j=(i+1):r
      fprintf('\n  sub-phase %d/%d:\n', i, j) ;
      lji = p*W(j,i) ;
      if abs(lji)>0
        W(j,:) = W(j,:) - lji*W(i,:) ;
        W(j,i)=0 ;

        fprintf('\n    subtract %s times the %d. row from the %d. row\n', strtrim(rats(lji)), i, j);
        printout(W) ;
      else
        fprintf('\n    nothing to eliminate\n');
      end
      
      paktc() ;
    end
  end

  if succ==0 
    return 
  end

    
  fprintf('\nbackward elimination\n') ;  
  fprintf('\nphase 0:\n') ;
  printout(W) ;
  for i=r:-1:1
    fprintf('\nphase %d:\n', i) ;
    p = 1.0/W(i,i) ;
    fprintf('\n  pre-phase: normalize.\n');
    W(i,:) = p*W(i,:) ;

    printout(W) ;
    
    for j=i-1:-1:1
      fprintf('\n  sub-phase %d/%d:\n', i, j) ;
      lji = W(j,i) ;
      if abs(lji)>0
        W(j,:) = W(j,:) - lji*W(i,:) ;
        W(j,i)=0 ;

        fprintf('\n    subtract %s times the %d. row from the %d. row\n', strtrim(rats(lji)), i, j);
        printout(W) ;
      else
        fprintf('\n    nothing to eliminate\n');
      end
      
      paktc() ;
    end
  end
  
  if succ==1
    iA = W(:,(r+1):2*r) ;
  end
end
