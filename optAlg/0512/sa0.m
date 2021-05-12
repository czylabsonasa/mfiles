% szimulalt hutes
% elso kozelites-vázlat

clear;
clf;
close all;

% dimenzio
dim=1;

% a célfüggvény
E = @(x)-(cos(10*x)-sin(60*x)).^2;


% kiszamoljuk az igazi-t (ranezesre)
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
nextRho=@(r) r;

% kezdo homerseklet (T0)
T0=100;
% vegso homerseklet
Tmin=0.1;
% kovetkezo homerseklet
nextT=@(t) 0.9*t;

% lepesek szama "szintenként"
NT=3;



% fun calls
ncall=1;

% kezdo pont es energia
x0=U();
E0=E(x0);
T=T0;
rho=(b-a)/3;

while T>Tmin

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

  T=nextT(T);
  rho=nextRho(rho);
end

fprintf("állapot=%f \n",x0)
fprintf("energia=%f\n",E0)
fprintf("\nigazi=%f\n",-3.8684)
fprintf("\nncall=%d\n",ncall)
