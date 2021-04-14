maxit=1000;
tol=1e-5;
% A=[1 2; 3 4];
% A=A'*A;
% b=[1,2]';
% c=3;
% 
% x0=rand(2,1);
% [xx,flag]=uLINGRADIENTsol(A,b,c,x0,maxit,tol);
% 
% flag
% it=length(xx)
% xx(:,end)
% A\b


A=randi(5,5);A=A'*A;
b=[1,2,3,4,5]';
c=77;
x0=rand(5,1);
[xx,flag]=uLINGRADIENTsol(A,b,c,x0,maxit,tol);

flag
it=length(xx)
xx(:,end)
A\b


[xx,flag]=uLINCGsol(A,b,c,x0,maxit,tol);

flag
it=length(xx)
xx(:,end)
A\b

