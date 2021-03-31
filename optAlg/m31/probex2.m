f = @(x,y) exp(x).*(4*x.^2 + 2*y.^2 + 4*x.*y + 2*y - 1);
x=optimvar('x');
y=optimvar('y');
obj=f(x,y);
prob=optimproblem('Objective',obj);
con1=x.*y/2 + (x+2).^2 + (y-2).^2/2 <= 2;
prob.Constraints.con1 = con1;
con2=x.*y/2 + (x+1).^2 + (y-1).^2/2 <= 2;
prob.Constraints.con2 = con2;


x0.x=-3;
x0.y=3;
[sol,fval]=solve(prob,x0);

%show(prob)
x0.x = -1;
x0.y = 1;
[sol2,fval2] = solve(prob,x0);

g1 = @(x,y) x.*y/2+(x+2).^2+(y-2).^2/2-2;
gg1 = @(x,y) x.*y/2+(x+2).^2+(y-2).^2/2-1;
g2 = @(x,y) x.*y/2+(x+1).^2+(y-1).^2/2-2;
gg2 = @(x,y) x.*y/2+(x+1).^2+(y-1).^2/2-1;


rnge = [-7 2 -2.5 8];
fimplicit(g1,'k-')
hold on
%fimplicit(gg1,'g-.')
fimplicit(g2,'k-')
%fimplicit(gg2,'g-.')


axis(rnge);
fcontour(f,rnge,'LevelList',logspace(-1,1,20))
plot(sol.x,sol.y,'ro','LineWidth',2)
plot(sol2.x,sol2.y,'ko','LineWidth',2)
legend('con1','con2','f Contours','sol1','sol2','Location','northoutside');
hold off
