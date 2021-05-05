% első példa
% sok futás ugyanarra az m-re, milyen a kapott értékek eloszlása
% histogram rajzolas

clear;
clf;
close all;


% a célfüggvény
f = @(x) -(cos(10*x)-sin(60*x)).^2;

% a domain:
a = 0;
b = 0.5;

% U: egyenletes az Omega halmazon
U = @() a + (b-a)*rand();


m=5000;
futasok=500;
opt=zeros(futasok,1);
for j=1:futasok
  loc = inf;
  val = inf;
  for i = 1:m
    u = U();
    fu = f(u);
    if fu < val
      val =fu;
      loc = u;
    end
  end
  opt(j)=val;
end

hist(opt);
fprintf("átlag=%f szórás=%f\n",mean(opt),std(opt));
