clear;
clf;
xx=-5:0.03:5;

syms x;
y=piecewise(-5<x<-pi,1,-pi<x<0,-1,0<x<pi,1,pi<x<5,-1);

fig=figure(1);
nf=3;
for it=1:nf
   subplot(nf,1,it);
   eddig=5^it;
   plot(xx,psum(xx,eddig));
   hold on;
   fplot(y);
   %plot(xx,f(xx),'r');
   title(sprintf('n=%d',eddig));
end


% szkriptben a vegere kellenek a fv defek
% function ret=f(t) % negyszog
%    ret=(-1).^floor(t/pi);
% end


function ret=psum(t,n) % négyszög - Fourier reszletosszege
   ret=zeros(size(t));
   for it=1:n
      ret=ret+sin((2*it-1)*t)/(2*it-1);
   end
   ret=4/pi*ret;
end
