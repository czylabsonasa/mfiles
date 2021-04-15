% 15 april examples

xx=linspace(-5,5);


% f=@(x) cos(x)-x;
f=@(x) exp(x) - 4*x.^2;
df=@(x) exp(x) - 8*x;


plot(xx,f(xx),[-5,5],[0,0]);

%bs=bisect(f,0,1,20)

n=newton(f,df,0.5,7)
fz=fzero(f,0.5)
abs(fz-n)






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