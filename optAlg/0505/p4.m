% a gradiens modszer sztochasztikus modositasa

clear;
clf;
close all;

% a célfüggvény

% f = @(x,y) (x.^4-16*x.^2+5*x)/2 + (y.^4-16*y.^2+5*y)/2; 
% a domain: 
% a1 = -4;
% b1 = 4;
% a2 = -4;
% b2 = 4;

f = @(x,y) (x.*sin(20*y)+y.*sin(20*x)).^2 .* cosh(sin(10*x).*x)+...
(x.*cos(10*y)-y.*cos(10*x)).^2 .* cosh(cos(20*y).*y);
a1 = -1;
b1 = 1;
a2 = -1;
b2 = 1;



F = @(v) f(v(1),v(2));

dF=@(x,d)F(x+d)-F(x-d);


% U: egyenletes az Omega halmazon (ami egy téglalap)
U = @() [a1 + (b1-a1)*rand(); a2 + (b2-a2)*rand()];
inU = @(v) a1<=v(1) && v(1)<=b1 && a2<=v(2) && v(2)<=b2; 
% maxit:
maxit = 50;

% az összes pont:
t = zeros(2,maxit+1);
% ertekek
Ft = zeros(maxit+1,1);


% init, random kezdőpont
t(:,1)=U();
Ft(1)=F(t(:,1));
k=1;

% spec alfa beta sorozat
a=1/2;
b=sqrt(a);

it=k+1;
while true
  if it>maxit, break; end
  tk=t(:,k);
  Ftk=F(tk);

  % egységkoron egyenletes
  fi=2*pi*rand();
  c=[cos(fi); sin(fi)];

  g=0.5*a/b*dF(tk,b*c)*c;
  
  u=tk-g;
  Fu=F(u);
  if true==inU(u) 
  %&& norm(g)<1
  %&& Fu<Ftk
    k=k+1;
    t(:,k)=u;
    Ft(k)=Fu;
    a=1/(k+1);
    b=sqrt(a);
  end
  it=it+1;
end


[rloc,rval]=fminunc(F,[0.1;0.1]);
fprintf("rloc=(%.2f,%.2f) rval=%.2f\n",rloc(1),rloc(2),rval);
loc=t(:,k);
val=Ft(k);
fprintf("loc=(%.2f,%.2f) val=%.2f\n",loc(1),loc(2),val);
fprintf("maxit=%d k=%d\n",maxit,k);



% ad-hoc rajzolgatas
dd = linspace(a1,b1,50);
[X,Y]=meshgrid(dd,dd);
Z=f(X,Y);
contour(X,Y,Z);
hold on;
plot(rloc(1),rloc(2),'r*');


plot(t(1,1:k),t(2,1:k),'bx-');
plot(t(1,1),t(2,1),'ko');
plot(loc(1),loc(2),'kx');
