% szimulalt hutes
% masodik verzio
% T: egy elore adott sorozat
% rho: egy elore adott sorozat
% adott szamu homerseklet szintet vizsgal: maxLev


clear;
clf;
close all;

% dimenzio
dim=1;

% a célfüggvény
E = @(x)-(cos(10*x)-sin(60*x)).^2;


% [l0,v0]=fminunc(E,0.33)
% [l1,v1]=fminunc(E,0.6)
% [l2,v2]=fminunc(E,0.97)


% a domain
a = 0;
b = 1;


% U: egyenletes az Omega halmazon
U = @() a + (b-a)*rand(dim,1);

% a tartomanyban maradas ellenorzese
inDom= @(x) all(a<=x & x<=b);

% uj pont generalas
deltaX=@(d) d*rand(dim,1)-0.5*d;

% a szintnek megfelelol homerseklet
getT=@(lev,x) 1/log(1+lev);
% "lepeskoz"
getRho=@(lev,x) sqrt(x);


% fun calls
ncall=1;

% kezdo homerseklet (T0)
T=getT(1,0);
% vegso homerseklet

% kezdo lepes nagysag
rho=getRho(1,T);

% lepesek szama "szintenként"
NT=3;

% max szint
maxLev=10;

% kezdo pont es energia
x0=U();
E0=E(x0);

lev=1;
while lev<maxLev

  nt=0;
  while nt<NT
    while true
      x1=x0+deltaX(rho);
      if true==inDom(x1)
        break; 
      end
    end
    E1=E(x1); ncall=ncall+1;

    dE=E1-E0;
    if dE<=0 || (dE>0 && (rand()<exp(-dE/T)))
      x0=x1;
      E0=E1;
      nt=nt+1;
    end
  end

  lev=lev+1;
  T=getT(lev,T);
  rho=getRho(lev,T);
end

fprintf("állapot=%f \n",x0)
fprintf("energia=%f\n",E0)
fprintf("igazi=%f\n",-3.8684)
fprintf("\nncall=%d\n",ncall)
