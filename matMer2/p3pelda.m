clf;
clear;

syms x;
y=piecewise(-4<x<0,12,x==0,14,0<x<4,16);

xx=linspace(-4,4,300);

lepesek=[5,10,15];
nf=length(lepesek);
for it=1:nf
   subplot(nf,1,it);
   fplot(y);
   hold on;
   plot(xx,psum(xx,lepesek(it)))
   title(sprintf('n=%d',lepesek(it)));
end

function ret=psum(t,n)
   ret=zeros(size(t));
   for it=1:n
      ret=ret+sin((2*it-1)*pi/4*t)/(2*it-1);
   end
   ret=2*4/pi*ret+14;
end
