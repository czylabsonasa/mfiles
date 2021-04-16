% apr 16

xx=linspace(-5,5);


% f=@(x) cos(x)-x;
% df=@(x) -sin(x)-1;

% f=@(x) exp(x) - 4*x.^2;
% df=@(x) exp(x) - 8*x;

% f=@(x)log(x)-x+2;


plot(xx,f(xx),[1,5],[0,0]);

%return

%bs=bisect(f,0,1,20)
%n=newton(f,df,0.5,5)

s=secant(f,0.3,0.35,8)

fz=fzero(f,0.325)
abs(s-fz)




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
