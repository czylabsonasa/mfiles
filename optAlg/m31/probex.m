f = @(x,y) exp(x).*(4*x.^2 + 2*y.^2 + 4*x.*y + 2*y - 1);
x=optimvar('x');
y=optimvar('y');
obj=f(x,y);
prob=optimproblem('Objective',obj);

con1=x.*y/2 + (x+2).^2 + (y-2).^2/2 <= 2;
prob.Constraints.constr = con1;
x0.x=-3;
x0.y=3;
[sol,fval]=solve(prob,x0)

%show(prob)
x0.x = -1;
x0.y = 1;
[sol2,fval2] = solve(prob,x0)

g = @(x,y) x.*y/2+(x+2).^2+(y-2).^2/2-2;
gg = @(x,y) x.*y/2+(x+2).^2+(y-2).^2/2-1;

rnge = [-7 2 -2.5 8];
fimplicit(g,'k-')
hold on
fimplicit(gg,'g-.')

axis(rnge);
fcontour(f,rnge,'LevelList',logspace(-1,1,20))
plot(sol.x,sol.y,'ro','LineWidth',2)
plot(sol2.x,sol2.y,'ko','LineWidth',2)
legend('Constraint','f Contours','sol1','sol2','Location','northoutside');
hold off
