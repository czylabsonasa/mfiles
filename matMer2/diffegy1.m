        0>0;
          1;
       1----1;

 
clear all ;
clf ;

syms y(t) ;
feladatok ;

% F = lista{1} ;
F = lista{2} ;

egyenlet = F.symf ;
f = F.numf ;
xx = F.xx ;
tb = F.tb ;
yb = F.yb ;
IVPS = F.IVPS ;

altalanosMegoldas = dsolve(egyenlet)
[T,Y] = meshgrid(tb, yb) ;
dY = f(T,Y) ;
dT = ones( size(dY) ) ;
quiver(T,Y,dT,dY) ;
axis([tb(1) tb(end) yb(1) yb(end)]) ;

hold on ;

for v=IVPS
  a = v(1) ;
  b = v(2) ;
  aktsol = matlabFunction(dsolve(egyenlet, y(a)==b)) ;
  plot(xx, aktsol(xx)) ;
end
legend('quiver', 'ivp1', 'ivp2', 'ivp3') ;
legend('location','northeastoutside') ;

save F.name
