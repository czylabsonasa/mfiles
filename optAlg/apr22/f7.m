clear;
clf;
close all;

t=0:0.5:10;
t=t';

y=[-0.155 -1.079 0.086 0.887...
  -0.037 -0.728 0.003 0.596 0.020...
  -0.487 -0.035 0.397 0.043 -0.324 ...
  -0.048  0.264 0.049 -0.214 -0.048 0.173 0.046];
y=y';

length(t)
length(y)

fun=@(x,T) x(1)*exp(x(2)*T).*cos(x(3)*T+x(4));

par=lsqcurvefit(fun,[1,1,1,1]',t,y);

sol=@(T) fun(par,T);
xx=linspace(-0.5,10.5);
plot(t,y,'r*',xx,sol(xx),'b')

norm(sol(t)-y)