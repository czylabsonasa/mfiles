clear all
N=10000000;
x=rand(1,N);

disp('a naive way:')
tic
for i=1:N 
  y(i)=x(i)+i;
end
toc

disp('a little bit smarter:')
tic
yy=zeros(1,N);
for i=1:N 
  yy(i)=x(i)+i;
end
toc

disp('last one')
tic
yyy = x + (1:N) ;
toc


