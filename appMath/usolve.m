function x=usolve(U,b)
% 
% solves the Ux=b for upper triangular mtx
% assumption: U has nonzero the diagonal elements
% 

  % start at the bottom - the simplest 'equation'
  sz = size(U) ;
  r = sz(1) ;
  x = b ;
  fprintf('\nphase 0:\n') ;
  printout([U,x]) ;
  for i=r:-1:1
    fprintf('\nphase %d:\n', 1+r-i) ;
    s = U(i,(i+1):r)*x((i+1):r) ; % using the elements already computed
    x(i) = (x(i) - s) / U(i,i) ;
    printout([U,x]) ;
    paktc() ;
  end
  fprintf('\n') ;
end
