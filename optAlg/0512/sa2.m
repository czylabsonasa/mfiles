% szimulalt hutes
% diszkret

clear;
clf;
close all;

% ez a graf
n=100;
C=randi(10,n,n);
C=C+C'; % hogy szimmetrikus legyen

% seged a kivalasztashoz
seged=(2:n);

% a szintnek megfelelol homerseklet
M=1;
getT=@(lev) M/log(1+lev);

% kezdo homerseklet (T0)
T=getT(1);


% lepesek szama "szintenként"
NT=10;

% max szint
maxLev=30;

% random permutacio, az egyes fixen az elso helyen
U=@() [1,randperm(n-1)+1];

% kezdo pont es energia
x0=U();
E0=E(x0,C);
% fun calls
ncall=1;


lev=1;
while lev<maxLev

  nt=0;
  while nt<NT
    seged=sample2(seged);
    i1=seged(1);
    i2=seged(2);

    x1=x0;
    x1([i1,i2])=x1([i2,i1]);
    E1=E(x1,C); ncall=ncall+1;

    dE=E1-E0;
    if dE<=0 || (dE>0 && (rand()<exp(-dE/T)))
      x0=x1;
      E0=E1;
      nt=nt+1;
    end
  end

  lev=lev+1;
  T=getT(lev);
end

% fprintf("állapot=%d \n",x0) % tul sokat ir ki
fprintf("energia=%f\n",E0)
fprintf("igazi=?\n") % brute force-val, kis grafokra
fprintf("\nncall=%d\n",ncall)


function y=E(x,cost)
  n=length(x);
  y=0;
  for i=1:n-1
    y=y+cost(x(i),x(i+1));
  end
  y=y+cost(x(n),x(1));
end

function s=sample2(s)
  n=length(s);
  i=randi(n);
  s([1,i])=s([i,1]);
  i=1+randi(n-1);
  s([2,i])=s([i,2]);
end
