clear;
clf;
close all;

y=dlmread("idosor.txt");
N=length(y);
t=(1:N)';



plot(t,y);

N0=80;

b=y((4:N0)');
A=y(repmat((0:(N0-4))',1,3)+[1 2 3]);
a0=(A'*A)\(A'*b);


yb=y;
for k=(N0+1):N
  yb(k)=a0'*yb(k-3:k-1);
end
hold on;
plot(t(N0+1:N),yb(N0+1:N),'r*')





