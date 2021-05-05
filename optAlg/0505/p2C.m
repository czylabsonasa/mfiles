% vak keresés
% tortenet beepitese:
% csak a legutolso eddigi nehany legjobbat figyeljuk -> W
% szabaly az elfogadasra:
% az uj ertek az W atlagatol 
% legalabb az W szorasanak valahanyszorosaval kisebb

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


% nW meretu suffix-et figyelunk a generalt sorozatban
nW=5;

% init, random kezdőpontok (nem nezunk nagysagrendet)
for it=1:nW
  t1=U();
  t(:,it)=t1;
  Ft(it)=F(t1);
end
% nW-pont van meg
k=nW;

it=nW+1;
while true
  if it>maxit, break; end
  u = U();
  Fu = F(u);
  if Fu < Ft(k) || Fu < mean(Ft(k-nW+1:k))-2*std(Ft(k-nW+1:k))
    k=k+1;
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