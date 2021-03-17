clear ;
% clf ;

f = @(t,y) sin(3*t)*y + (2*t-1) ;


t0 = 0 ; y0 = 2 ;
tv = 1 ;

n = 6 ;

h = (tv - t0) / n ;

y = y0 ; t = t0 ;
for k=1:n
  y = y + f(t,y)*h ;
  t = t + h ;
end
fprintf("sima       \t %.4f\n",y) ;
return ;

n = floor(n/2) ;
h = (tv - t0 )/n ;
y = y0 ; t = t0 ;
for k=1:n
  M1 = f(t,y) ;
  M = f(t+0.5*h, y + M1*0.5*h) ;
  y = y + M*h ;
  t = t + h ;
end
fprintf("kozeppontos\t %.4f\n",y) ;



n = floor(n/2) ;
h = (tv - t0 )/n ;
y = y0 ; t = t0 ;
for k=1:n
  M1 = f(t,y) ;
  M2 = f(t+0.5*h, y + M1*0.5*h) ;
  M3 = f(t+0.5*h, y + M2*0.5*h) ;
  M4 = f(t+h, y + M3*h) ;
  M = (1*M1 +  2*M2 +  2*M3 + 1*M4)/6 ;
  
  y = y + M*h ;
  t = t + h ;
end
fprintf("RKIII      \t %.4f\n",y) ;




[tt,yy] = ode45(f, [t0, tv], y0) ;
fprintf("ode45      \t %.4f\n",yy(end)) ;


% syms y(t)
% egyenlet = diff(y,t) == cos(-2*t)*y + sin(3*t) ;
% % mo = matlabFunction(dsolve(egyenlet, y(t0)==y0)) ;
% dsolve(egyenlet, y(t0)==y0)
% 
% % fprintf("pontos     \t %.4f\n",mo(tv)) ;

