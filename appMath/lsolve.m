function x=lsolve(L,b)
% 
% solves the Lx=b for lower triangular mtx
% assumption: L has nonzero the diagonal elements
% 

  % start at the top - the simplest 'equation'
  sz = size(L) ;
  r = sz(1) ;
  x = b ;
  fprintf('\nphase 0:\n') ;
  printout([L,x]) ;
  for i=1:r
    fprintf('\nphase %d:\n', i) ;
    s = L(i,1:(i-1))*x(1:(i-1)) ; % using the elements already computed
    x(i) = (x(i) - s) / L(i,i) ;
    printout([L,x]) ;
    paktc() ;
  end
  fprintf('\n') ;
end
