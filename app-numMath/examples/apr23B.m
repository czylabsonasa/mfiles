% polinom gyoke

clear;
clf;
close all;

f=@(x,y) x.^4+x.^3*x.^2+y.^2-y+1;
F=@(v) f(v(1),v(2));
be=linspace(-2,2,30);
[X,Y]=meshgrid(be,be);
Z=f(X,Y);
[Gx,Gy]=gradient(-Z);
L=sqrt(Gx.^2 + Gy.^2);
quiver(X,Y,Gx./L,Gy./L)
% meshc(X,Y,Z);

[loc,val]=fminunc(F,[0,0.5])
[loc,val]=fminsearch(F,[-0.5,0.5])
[loc,val]=fminunc(F,[0.5,0.5])


return
% p = [1 1 -16 20 0];
% roots(p)

% return


syms z;
F=cos(z^2-1/2)-2*z*sin(z^2+z)-1;
dF=diff(F,z);

f=matlabFunction(F);
df=matlabFunction(dF);


% return

 xx = linspace(-3,3,100);

plot(xx,f(xx),'b')
%hold on
%plot(xx,df(xx),[-3,3],[0,0])


% return

% hold on
% plot([-5,5],[0,0])

fzero(df, -0.5)
fsolve(df, -0.5)

fzero(df, 1)
fsolve(df, 1)

gyok=secant(df, -0.8,-0.7, 5)


% yy=f(xx);
% xx(abs(yy)<1e-3)



% dp=polyder(p);
% df=@(x) polyval(dp,x);
% elso=secant(f,-4,-4.1,5)
% masodik=secant(f,-1,-1.1,5)
% harmadik=secant(f,1,1.1,5)



function x=newton(f,df,x,L)
  for k=1:L
    x=x-f(x)/df(x);
  end
end

function x1=secant(f,x0,x1,L)
  for k=1:L
    x2=x1-f(x1)/(f(x1)-f(x0))*(x1-x0);
    x0=x1;
    x1=x2;
  end
end











