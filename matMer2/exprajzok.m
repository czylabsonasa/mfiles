% hf 8-g megcsinalni -> subplot 4,2

f=@(x) exp(x);

f1=@(x) ones(size(x));
f2=@(x) f1(x) + x;
f3=@(x) f2(x) + x.^2/2;
f4=@(x) f3(x) + x.^3/6;

fvek={f1,f2,f3,f4};

xx=linspace(-3,3);
for k=1:4
  subplot(4,1,k);
  fk=fvek{k};
  plot(xx,f(xx),xx,fk(xx));
  legend('e^x',sprintf("%d. rendű közelítés",k));
  legend('location','northeastoutside');
end
