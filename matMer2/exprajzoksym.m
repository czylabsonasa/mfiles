% hf modositani sin-ra

f=@(x) sin(x);
fname="sin(x)";
syms F(x)
F(x)=sin(x);


xx=linspace(-3,3);
for k=1:8
  subplot(4,2,k);
  fk=taylor(F,x,0,'order',2*k-1) % megnezni a helpben !!!
  plot(xx,f(xx),xx,fk(xx));
  ylim([-1.1,1.1]);
  legend(fname,sprintf("%d. rendű közelítés",2*k-1-1));
  legend('location','northeastoutside');
end
