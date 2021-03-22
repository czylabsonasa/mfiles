clear ;
clf ;
fprintf("Runge phenomena\n") ;

R=@(t) 1 ./ (1+t.^2);
xx = linspace(-5,5) ;
yy = R(xx) ;

for n=3:10
  t=linspace(-5,5,n+1);
  p=polyfit(t,R(t),n);
  plot(xx,yy,xx, polyval(p, xx)) ;
  title(sprintf("%d equidistant nodes",n+1)) ;
  pause() ;
end