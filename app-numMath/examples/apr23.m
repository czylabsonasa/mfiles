clear;
clf;
close all;


% intervallum?
% brute-force
% pl. -3,3

% p=[1 4 -13 -40 48]';

%f=@(x) cos(x.^6)-sin(x.^3-1);

% % brute force
%xx=linspace(-5,5,100);   % :op is hasznalhato
% yy=polyval(p,xx);
% zz=abs(yy);
% filter=zz<1e-9;
% sum(filter)
% xx(filter)

% abrazol
%f=@(x) polyval(p,x);
% yy=f(xx);
%plot(xx,f(xx),[-5,5],[0,0])
% fzero, fsolve

% polinom:
% roots(p)


% minimum kereses
% f=@(x) sin(x.^2-1)+x.*cos(x);
% xx=linspace(-3,3,100);   % :op is hasznalhato
% yy=f(xx);
%dyy=diff(yy); ezt lehetne vizsgalni...
% mini=min(yy)
% helyek=xx(yy==mini)
% df=@(x) cos(x.^2-1).*x*2 + cos(x)-x.*sin(x);


% fplot(f,'b')
% hold on
% fplot(df)
% plot([-5,5],[0,0])

% fzero(df, [-1,0])
% fminbnd(f,-1,0)

be=linspace(-2,2,50);
[X,Y]=meshgrid(be,be);
f=@(x,y) x.^6+x.^4 .*y.^2-3*x.^4+x.^2.*y.^2-1;
F=@(v) f(v(1),v(2));
Z=f(X,Y);
%mesh(X,Y,Z);
contour(X,Y,Z)
[Gx,Gy]=gradient(Z);
L=sqrt(Gx.^2+Gy.^2);
quiver(X,Y,Gx./L,Gy./L);


[loc, val] = fminsearch(F, [-1.5,0]);
loc
val
[loc2, val2] = fminsearch(F, [1.5,0]);
loc2
val2









