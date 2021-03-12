clf ;
hold off

R=@(t) 1 ./ (1+t.^2);

xx = linspace(-5,5,200) ;
plot(xx, R(xx)) ;
hold on ;

t = linspace(-5,5,11) ;
f = R(t) ;
msp = spline(t, [0 f 0]) ;

plot(xx,ppval(msp, xx)) ;

% plot( xx, spline(t, [0 f 0], xx ))