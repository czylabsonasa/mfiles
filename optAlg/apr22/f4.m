% a 4. feladat generalt adattal

clear; 
clf;
close all;

n=200;

t=linspace(0,4*pi,n)';
%y=sin(t)+sin(2*t);
y=sin(t)+t.*sin(2*t.^2);



megvan=30; % ez százalék

van=rand(n,1)<megvan/100; 
hiany=~van;


tv=t(van);
yv=y(van);
th=t(hiany);
yh=t(~hiany);

subplot(3,1,1);
plot(tv,yv,'k*',t,y,'b')
xlim([0,4*pi]);

S=eye(n);
Sv=S(van,:); % S van
Sn=S(hiany,:); % S hianyzik

% elsorendu
D=diag(ones(n,1))+diag(-1*ones(n-1,1),1);

% masodrendu
%D=diag(ones(n,1))+diag(-2*ones(n-1,1),1)+diag(ones(n-2,1),2);


A=D*Sn';
b=D*Sv'*yv;
yh=(A'*A)\(-A'*b);

subplot(3,1,2);
plot(th,yh,'r*',t,y,'b')
xlim([0,4*pi]);


subplot(3,1,3);
plot(tv,yv,'k*',th,yh,'r*',t,y,'b')
xlim([0,4*pi]);



