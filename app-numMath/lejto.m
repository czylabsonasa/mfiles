clear ;
close ;
clf ;

plot([0,1],[0,1],'b') ; 
hold on ;
plot([2,3],[2,2],'b') ; 
H=@(t) 1+(t-1)-(t-1).^2 .* (t-2) ;
xx = linspace(1,2) ;
plot(xx,H(xx),'r') ;

ylim([-0.5,2.5]) ;

axis square ;
% axis equal ;
grid on ;
