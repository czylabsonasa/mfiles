clear ;
clf ;
fprintf("Runge phenomena+computing the absolute difference\n") ;

R=@(t) 1 ./ (1+25*t.^2);
xx = linspace(-1,1) ;
yy = R(xx) ;

fprintf("\n\tmax abs difference=\n");
for n=3:20
  t=linspace(-1,1,n+1);
  p=polyfit(t,R(t),n);
  plot(xx,yy,xx, polyval(p, xx)) ;
  title(sprintf("%d equidistant nodes",n+1)) ;

  mxdiff=max(abs(R(xx)-polyval(p,xx))) ; 
  fprintf("\t%.2f\n",mxdiff);
  
  pause() ;
end