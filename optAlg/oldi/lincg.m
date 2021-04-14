function [x,k,rr] = lincg(A,b,x,epsi)
  r=b-A*x;
  rr=r'*r;
  p=r;
  k=0;
  while 1
    Ap=A*p;
    alfa=rr/(p'*Ap);
    x=x+alfa*p;
    if rand()<0.1, 
      r=b-A*x;
    else
      r=r-alfa*Ap;
    end
    rruj=r'*r;
    if rruj<epsi^2,break;end
    p=r+(rruj/rr)*p;
    rr=rruj;
    k=k+1;
  end
end
