clear;
clf;

fxy=@(x,y) 4*x.^2+y.^2-x-3*y-2;
f=@(v) fxy(v(1),v(2));

[loc,val,flag]=fmincon(f,[1,1]',[],[],[],[],[],[],@mycon);


%fcontour(fxy);

[X,Y]=meshgrid(linspace(-5,5,50),linspace(-5,5,50));
contour(X,Y,fxy(X,Y),val*[0.1, 1, 1.2]);
hold on;


fimplicit(@g1xy);

plot(loc(1),loc(2),'k*');

axis equal;



function [c,ceq] = mycon(x)
  c = [g1(x)];
  ceq = [];
end

function z=g1xy(x,y) 
  z=x.^2+3*y.^2+x+2*y;
  %z=x.^2+3*y.^2+x+2*y-15; % a feltétel nélküli minimumot tartalmazza

end

function z=g1(x) 
  z=g1xy(x(1),x(2));
end
