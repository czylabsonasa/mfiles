clf;
clear;

syms x;
f=piecewise(-5<x<0,-3,x==0,3,0<x<5,9);

xx=linspace(-10,10,400);

tagok=[5,10,15];
nt=length(tagok);
for it=1:nt
   subplot(nt,1,it);
   fplot(f);
   hold on;
   plot(xx,furi(xx,tagok(it)))
   title(sprintf('n=%d',tagok(it)));
end

function ret=furi(t,n)
   ret=zeros(size(t));
   for it=1:n
      ret=ret+sin((2*it-1)*pi/5*t)/(2*it-1);
   end
   ret=3+6*4/pi*ret;
end
