fun=fCUBIC2();
x0=[2,2]';

xx = uFMS(fun,x0);
fprintf("-------------------\n");
xx = uNEWTON(fun,x0);
fprintf("-------------------\n");
xx = uCGLS(fun,x0,lsFMS(),0);
fprintf("-------------------\n");
