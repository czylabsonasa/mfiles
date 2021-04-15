% 15 april examples

xx=linspace(-5,5);


f=@(x) cos(x)-x;



plot(xx,f(xx),[-5,5],[0,0]);

bisect(f,0,2,20)
fzero(f,0)



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