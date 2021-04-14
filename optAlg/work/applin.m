maxit=1000;
tol=1e-8;

% A=[1 2; 3 4];
% A=A'*A;
% eig(A)
% b=[1,2]';
% c=3;
% 
% x0=100*rand(2,1);
% [xx,flag]=uLINGRADIENT(A,b,c,x0,maxit,tol);
% 
% flag
% it=length(xx)
% xx(:,end)
% A\b


n=10;
A=randi(20,n);A=A'*A;
b=rand(n,1);
c=77;
x0=rand(n,1);

[xx,flag]=uLINGRADIENT(A,b,c,x0,maxit,tol);


flag
it=length(xx)
xx(:,end)
jo=A\b

fprintf("------------------------------\n");
[xx,flag]=uLINCG(A,b,c,x0,maxit,tol);

flag
it=length(xx)
xx(:,end)
jo

