clear ;
clf ;

% t = [15 46 74 105 135 166 196 227 258 288 319 349]' ;
% f = [-1.7 0.1 5.2 10.3 15.8 18.9 21.1 20.3 16.1 10.2 4.2 0.5]' ;

% t = [0     2     4     6     8    10    12]' ;π
% f = [3.0000    4.0000    5.0000    5.5000    6.5000    7.0000    8.0000]' ;
% plot(t,f,'*') ;

t = [1 1 1] ;
f = [1 2 3] ;

p = polyfit(t,f,1) 

% xlim([min(t)-10,max(t)+10]) ;

m = length(t) ;
A = [ t , ones(m,1) ] ;
pp = (A'*A) \ (A'*f) 


% hold on ;
% xx = linspace(min(t)-10,max(t)+10) ;
% yy = x(1) + x(2)*cos(2*pi*(xx-14)/365) ;
% 
% plot(xx, yy) ;


