% apr 16

xx=linspace(-5,5);
aa=[-5,5];

f=@(x) x.^3-3*x+2; % ((x+0)*x-3)*x+2
df=@(x) 3*x.^2-3;

% f=@(x) x.^2;
% df=@(x) 2*x;

% f=@(x) cos(x)-x;
% df=@(x) -sin(x)-1;

% f=@(x) exp(x) - 4*x.^2;
% df=@(x) exp(x) - 8*x;

% f=@(x)log(x)-x+2;
% df=@(x) 1./x-1;


plot(xx,f(xx),aa,[0,0]);

% return

% [h,k,flag]=hurtol(f,3,3.5,1e-12,30)
% h
% k
% flag



% bs=bisect(f,4,4.5,10)

n=newtona(f,df,1.5,15,2)


% n=newtona(f,df,5,10,1.7)
% s=secant(f,0.3,0.35,8)

% fz=fzero(f,[4,4.5])
% elteres=abs(n-fz)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function m=hur(f,x0,x1,step)
  for i=1:step
    tmp=(f(x1)-f(x0))/(x1-x0);
    m=x1-f(x1)/tmp;
    if f(m)*f(x1)<0
      x0=m;
    else
      x1=m;
    end
  end
  m=0.5*(x0+x1);
end

function [m,k,flag]=hurtol(f,x0,x1,tol,maxit)
  flag="ok";
  k=0;
  while true
    if k>maxit, flag="maxit"; break; end
    m=x1-f(x1)*(x1-x0)/(f(x1)-f(x0));
    if abs(f(m))<tol, flag="ftol";break; end
    
    if f(m)*f(x1)<0
      x0=m;
    else
      x1=m;
    end
    if abs(x1-x0)<tol, flag="xtol"; break; end
    k=k+1;
  end
  %m=0.5*(x0+x1);
end




function x1=secant(f,x0,x1,step)
  for i=1:step
    dfx1=(f(x1)-f(x0))/(x1-x0);
    x2=x1-f(x1)/dfx1;
    x0=x1;
    x1=x2;
  end
end



function x=newton(f,df,x,step)
  for i=1:step
    x=x-f(x)/df(x);
    fprintf("%.15f\n",x);
  end
end

function x=newtona(f,df,x,step,a)
  for i=1:step
    x=x-a*f(x)/df(x)
  end
end


function m=bisect(f,a,b,step)
  for i=1:step
    m=0.5*(a+b);
    if f(a)*f(m)<0
      b=m;
    else
      a=m;
    end
  end
  m=0.5*(a+b);
end


function x=kobgyok(a,step)
  x=1;
  for i=1:step
    x=2/3*x+1/3*a/x^2
  end
end



% xx=linspace(-pi/2,pi/2);
% g=@(x) cos(x)/3;
% a=[-pi/2,pi/2];
% plot(xx,g(xx),a,a,a,[0,0]);
% 
% x=0.5
% for i=1:10
%   x=g(x)
% end

% return


% a=10;nthroot(a,3)
% 
% kobgyok(a,6)
% a^(1/3)
% 
% return
