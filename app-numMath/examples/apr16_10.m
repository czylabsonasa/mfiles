% apr 16

xx=linspace(-5,5);
aa=[-5,5];

% f=@(x) x.^3-2*x+2;
% df=@(x) 3*x.^2-2;

% f=@(x) x.^2;
% df=@(x) 2*x;

% f=@(x) cos(x)-x;
% df=@(x) -sin(x)-1;aimmf1

% f=@(x) exp(x) - 4*x.^2;
% df=@(x) exp(x) - 8*x;

% f=@(x)log(x)-x+2;

plot(xx,f(xx),aa,[0,0]);

return

% h=hur(f,0,1,50)

% bs=bisect(f,0,1,20)
n=newtona(f,df,5,10,1.7)
% s=secant(f,0.3,0.35,8)
% fz=fzero(f,[0,1])
% abs(n-fz)


function m=hur(f,x0,x1,step)
  for i=1:step
%     [x0,x1]
%     [f(x0),f(x1)]
    tmp=(f(x1)-f(x0))/(x1-x0);
    m=x1-f(x1)/tmp;
    if f(x1)*f(m)<0
      x0=m;
    else
      x1=m;
    end
  end
  m=0.5*(x0+x1);
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
    x=x-f(x)/df(x)
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
