% vak keresés
% tortenet beepitese:
% s: az eddigi ertekek osszege
% s2 az eddigi ertekek negyzetosszege
% + szabaly az elfogadasra:
% az uj ertek az eddigiek atlagatol 
% legalabb a szoras valahanyszorosaval kisebb
% tul sok regi informacio...

clear;
clf;
close all;

% a célfüggvény
f = @(x,y) (x.^4-16*x.^2+5*x)/2 + (y.^4-16*y.^2+5*y)/2; 
F = @(v) f(v(1),v(2));

% a domain: 
a1 = -4;
b1 = 4;
a2 = -4;
b2 = 4;


% U: egyenletes az Omega halmazon (ami egy téglalap)
U = @() [a1 + (b1-a1)*rand(); a2 + (b2-a2)*rand()];

% maxit:
maxit = 500;

% az összes pont:
t = zeros(2,maxit+1);
% ertekek
Ft = zeros(maxit+1,1);

% init, random kezdőpont
t1=U();
t(:,1)=t1;
Ft(1)=F(t1);
s=Ft(1);
s2=s*s;
% k-pont van meg
k=1;

it=2;
while true
  if it>maxit, break; end
  u = U();
  Fu = F(u);
%  if Fu < Ft(k) || Fu < s/k-4*sqrt(s2/k-(s/k)^2)
  if Fu < s/k-10*sqrt(s2/k-(s/k)^2)
    k=k+1;
    s=s+Fu;
    s2=s2+Fu^2;
    t(:,k) = u;
    Ft(k) = Fu;
  end
  it=it+1;
end


[rloc,rval]=fminunc(F,[-3;-3]);
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
