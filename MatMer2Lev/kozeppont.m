% módosított Euler módszer - középpont
clear ; 
clf ;

f=@(t,y) sin(2*t)-y ;

megoldas = @(t) (2*exp(-t))/5 - (5^(1/2)*cos(2*t + atan(1/2)))/5 ;


t0 = 0 ; y0 = 0 ;
tv = 2 ;
n = 2*2*5 ; % lepes 
h = (tv-t0)/n ;

xx = linspace(t0, tv) ;
plot(xx, megoldas(xx),'b') ;
hold on ;
plot(t0,y0,'ro') ;
for i=1:n
  tmpy = y0 + f(t0, y0)*0.5*h ;
  % t0 + 0.5*h , tmpy
  y0 = y0 + f(t0+0.5*h,tmpy)*h ;
  t0 = t0 + h ;
  plot(t0,y0,'rx') ;
end

n,abs(megoldas(tv)-y0)
