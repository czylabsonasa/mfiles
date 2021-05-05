% első példa

clear;
clf;
close all;

% a célfüggvény
f = @(x) -(cos(10*x)-sin(60*x)).^2;

% a domain: (módosítva hogy egyértelmű legyen a glob min)
a = 0;
b = 0.5;

% U: egyenletes az Omega halmazon
U = @() a + (b-a)*rand();

% egy körben ennyi pontot nézünk meg
m = 50;

% az összes pont vektora:
t = zeros(m,1);
ft = zeros(m,1);

% init
loc = inf;
val = inf;

for i = 1:m
  u = U();
  fu = f(u);
  if fu < val
    val =fu;
    loc = u;
  end
  t(i) = u;
  ft(i) = fu;
end

xx = linspace(a,b,300);
fxx = f(xx);

subplot(4,1,1);
plot(xx, fxx,'b');
xlim([a-0.1,b+0.1]);
ylim([-5,1]);

subplot(4,1,2);
plot(t, ft, 'r*');
xlim([a-0.1,b+0.1]);
ylim([-5,1]);

subplot(4,1,3);
plot(xx, fxx,'b', t, ft, 'r*');
xlim([a-0.1,b+0.1]);
ylim([-5,1]);


subplot(4,1,4);
hist(ft);




fprintf("loc=%f, val=%f\n",loc,val);
% a plot segítségével ("csalás")
[rloc,rval]=fminsearch(f,0.33);
fprintf("rloc=%f, rval=%f\n",rloc,rval);

