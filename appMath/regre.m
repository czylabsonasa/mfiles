t = [1 5 6 7 8]' ;
f = [411 5049 7137 9587 12413]' / 100 ;

plot(t,f,'*') ;
xlim([min(t)-1, max(t)+1]) ;
ylim([min(f)-3, max(f)+3]) ;

% polyfit
p = polyfit(t, f, 2) ;
polyval(p, 9)

xx = linspace(min(t)-1, max(t)+1) ;
hold on ;
plot(xx, polyval(p, xx)) ;
