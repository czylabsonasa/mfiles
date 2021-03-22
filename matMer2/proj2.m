hold off;
clf;
clear;

% explicit alak jobboldala: f
f=@(t,y) log(y)+cos(t)./(t+1);
t0=0; tv=7; y0=2; lepes=10;

[tE,yE]=Euler(f,[t0,tv],y0,lepes);
[tR,yR]=RK1(f,[t0,tv],y0,lepes);
plot(tE,yE,'*');
hold on
plot(tR,yR,'.');
[t45,y45]=ode45(f,[t0,tv],y0);
plot(t45,y45,'d');

legend('Euler','RK1','ode45', 'location','northeastoutside')



% Euler módszer
function [t,y]=Euler(f,tr,y0,lepes)
  t=linspace(tr(1),tr(2),lepes+1);
  y=zeros(size(t));
  h=t(2)-t(1); % == (tr(2)-tr(1)) / lepes
  y(1)=y0;
  for it=1:lepes
    y(it+1)=y(it)+h*f(t(it),y(it));
  end
end

% RK I változat az eloadas foliakban
function [t,y]=RK1(f,tr,y0,lepes)
  t=linspace(tr(1),tr(2),lepes+1);
  y=zeros(size(t));
  h=t(2)-t(1);
  y(1)=y0;
  for it=1:lepes
    k1=f(t(it),y(it));
    k2=f(t(it)+h/2,y(it)+h/2*k1);
    y(it+1)=y(it)+h*k2;
  end
end


