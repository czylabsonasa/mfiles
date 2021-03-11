clear ;
clf ;
fprintf("Runge phenomena\n") ;

R=@(t) 1 ./ (1+25*t.^2);
xx = linspace(-1,1) ;
yy = R(xx) ;

for n=3:20
  t=linspace(-1,1,n+1);
  p=polyfit(t,R(t),n);
  plot(xx,yy,xx, polyval(p, xx)) ;
  title(sprintf("%d equidistant nodes",n+1)) ;
  pause() ;
end