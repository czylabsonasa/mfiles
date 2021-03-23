hold off;
clf;
clear;

% explicit alak jobboldala: f
a=0.01; 
b=0.02;
% v(1) prey, v(2) predator
fv=@(t,v) [v(1)*(1-a*v(2)), v(2)*(-1+b*v(1))]' ;
t0=0; tv=30; y0=[20,20]'; 

lepesek=[1,2,4]*64 ;
for it=1:length(lepesek)
  lepes=lepesek(it) ;
  
  %[tE,yE]=EulerV(fv,[t0,tv],y0,lepes);
  [t,y]=RK1V(fv,[t0,tv],y0,lepes);
  subplot(4,1,it) ;
  plot(t,y(:,1),'b',t,y(:,2),'r');


  legend('prey','predator','location','northeastoutside')
  title(sprintf("RK1, lepes=%d",lepes))
end

[t,y]=ode23(fv,[t0,tv],y0);
subplot(4,1,4) ;
plot(t,y(:,1),'b',t,y(:,2),'r');
legend('prey','predator','location','northeastoutside')
title("ode23")




% Euler módszer
function [t,y]=EulerV(f,tr,y0,lepes)
  t=linspace(tr(1),tr(2),lepes+1);
  y=zeros(2,lepes+1);
  h=t(2)-t(1); % == (tr(2)-tr(1)) / lepes
  y(:,1)=y0;
  for it=1:lepes
    y(:,it+1)=y(:,it)+h*f(t(it),y(:,it));
  end
  y=y';
end

% RK I változat az eloadas foliakban
function [t,y]=RK1V(f,tr,y0,lepes)
  t=linspace(tr(1),tr(2),lepes+1);
  y=zeros(2,lepes+1);
  h=t(2)-t(1);
  y(:,1)=y0;
  for it=1:lepes
    k1=f(t(it),y(:,it));
    k2=f(t(it)+h/2,y(:,it)+h/2*k1);
    y(:,it+1)=y(:,it)+h*k2;
  end
  y=y';
end
