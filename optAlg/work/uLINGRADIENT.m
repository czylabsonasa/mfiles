function [xx,flag]=uLINGRADIENTsol(A,b,c,x,maxit,epsi)
  % a painless-ben leírtak szerint
  % 1/2*x'Ax - x'b + c alakú fv-re!

  fprintf("\nmódszer = lineáris legnagyobb csökkenés (kvadratikus fv-re)" );

  xx = [x];

  flag = "none" ;
  it = 0 ;
  r=b-A*x; % negatív gradiens (rezidual,maradék)
  delta=r'*r;
  tol=epsi^2*delta;

  while true
    it = it + 1;
    if delta<tol, flag="ok"; break; end
    if it>maxit, flag="maxit"; break; end
    q=A*r;
    alfa=delta/(r'*q); % itt nem kell linsearch
    x=x+alfa*r;
    xx=[xx,x];

    if mod(it,1)==0 % hiba halmozódás csökkentése, kivehető
      r=b-A*x;
    else
      r=r-alfa*q;
    end

    delta=r'*r;
  end
  
end
