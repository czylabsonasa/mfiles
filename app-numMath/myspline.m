xx = linspace(-5,5,11) ;
yy = R(xx) ;
xxx = linspace(-5,5,200) ;
clf ;
hold off
plot(xxx, R(xxx)) ;
hold on ;

msp = spline(xx, [0 yy 0]) ;
yyy = ppval(msp, xxx) ;
plot( xxx,yyy) ;

% plot( xxx, spline(xx, [0 yy 0], xxx ) )