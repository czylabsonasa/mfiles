clear;
clf;
clc;

F=@(t) log(1+t);
xx = linspace(0,2);

syms x ;
for k=1:4
  subplot(4,1,k);
  f=matlabFunction(taylor( log(1+x), x, 0, 'order', k))
  plot(xx,F(xx),xx,f(xx));
  legend('eredeti','taylor');
  ylim([0,1.5]);
  %axis square;
end

