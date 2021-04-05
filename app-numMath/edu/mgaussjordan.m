function iA=mgaussjordan(A)
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
  
  mprint('\nforward elimination\n\nphase 0:\n', W) ;
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
      fprintf(sprintf('\n  pre-phase: swap the %d. row with the %d. row\n', i,j),[])
      W([i,j],:) = W([j,i],:) ;
    end
    
    mprint('',W) ;
    
    p = 1.0/W(i,i) ;
    for j=(i+1):r
      fprintf('\n  sub-phase %d/%d:\n', i, j) ;
      lji = p*W(j,i) ;
      if abs(lji)>0
        W(j,:) = W(j,:) - lji*W(i,:) ;
        W(j,i)=0 ;

        mprint(sprintf('\n    subtract %s times the %d. row from the %d. row\n', strtrim(rats(lji)), i, j),...
          W) ;
      else
        mprint('\n    nothing to eliminate\n',[]);
      end
      
    end
  end

  if succ==0 
    return 
  end

    
  mprint('\nbackward elimination\n\nphase 0:\n', W)
  for i=r:-1:1
    fprintf('\nphase %d:\n', i) ;
    p = 1.0/W(i,i) ;
    W(i,:) = p*W(i,:) ;

    mprint('\n  pre-phase: normalize.\n', W) ;
    
    for j=i-1:-1:1
      fprintf('\n  sub-phase %d/%d:\n', i, j) ;
      lji = W(j,i) ;
      if abs(lji)>0
        W(j,:) = W(j,:) - lji*W(i,:) ;
        W(j,i)=0 ;

        mprint( sprintf('\n    subtract %s times the %d. row from the %d. row\n', strtrim(rats(lji)), i, j),...
          W) ;
      else
        mprint('\n    nothing to eliminate\n',[]);
      end
      
    end
  end
  
  if succ==1
    iA = W(:,(r+1):2*r) ;
  end
end
