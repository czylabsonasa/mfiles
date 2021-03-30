f=@(x) exp(x);
fname="e^x";
syms F(x)
F(x)=exp(x);


xx=linspace(-3,3);
for k=1:8
  subplot(4,2,k);
  fk=taylor(F,x,0,'order',k);
  plot(xx,f(xx),xx,fk(xx));
  legend(fname,sprintf("%d. rendű közelítés",k));
  legend('location','northeastoutside');
end
