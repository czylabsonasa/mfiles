% első példa
% kulonbozo m-ek összehasonlítása - hogyan változik a minimum?

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

% ennyi pontot nézünk meg, most vektor
M = 2.^(4:15);
opt=zeros(length(M),1);
for j=1:length(M)
  loc = inf;
  val = inf;
  m = M(j);
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

[rloc,rval]=fminsearch(f,0.33);
plot(1:length(M),opt,'*',[1,length(M)],[rval,rval]);
