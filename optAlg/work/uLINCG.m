function [xx,flag]=uLINCG(A,b,c,x,maxit,epsi)
  % a painless-ben leírtak szerint
  % 1/2*x'Ax - x'b + c alakú fv-re!

  fprintf("\nmódszer = konjugált gradiens (kvadratikus fv-re)" );

  xx = [x];

  flag = "none" ;
  it = 0 ;
  r=b-A*x; % negatív gradiens (rezidual,maradék)
  d=r;
  deltaU=r'*r;
  tol=epsi^2*deltaU;

  while true
    it = it + 1;
    if deltaU<tol, flag="ok"; break; end
    if it>maxit, flag="maxit"; break; end
    q=A*d;
    alfa=deltaU/(d'*q); % itt nem kell linsearch
    x=x+alfa*d;
    xx=[xx,x];

    if mod(it,1)==0 % hiba halmozódás csökkentése
      r=b-A*x;
    else
      r=r-alfa*q;
    end
    deltaR=deltaU;
    deltaU=r'*r;
    beta=deltaU/deltaR;
    d=r+beta*d;
    
  end
  
end
