clear;
clf;

fxy=@(x,y) 4*x.^2+y.^2-x-3*y-2;
f=@(v) fxy(v(1),v(2));





[loc,val,flag]=fmincon(f,[1,1]',[1 1;4 1],[1;2],[],[],[],[]);


% fcontour(fxy);
%[X,Y]=meshgrid(linspace(-5,5,50),linspace(-5,5,50));
%contour(X,Y,fxy(X,Y),val*[0.7,1,2],'b');
fcontour(fxy,'k','LevelList',val*[-2,-1,0,1,2]);


hold on;
fimplicit(@(x,y) x+y-1,'r');
fimplicit(@(x,y) x+y+1,'g-.');

fimplicit(@(x,y) 4*x+y-2,'r');
fimplicit(@(x,y) 4*x+y+5,'g-.');




plot(loc(1),loc(2),'k*');

axis equal;



function [c,ceq] = mycon(x)
  c = [];
  ceq = [g1(x)];
end

function z=g1xy(x,y) 
  z=(x+1).^2+(y+2).^2-3;
end

function z=g1(x) 
  z=g1xy(x(1),x(2));
end
