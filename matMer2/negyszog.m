clf;
xx=-5:0.03:5;
function ret=f(t) % negyszog
   ret=(-1).^floor(t/pi);
end

function ret=psum(t,n) % négyszög - Fourier reszletosszege
   ret=zeros(size(t));
   for it=1:n
      ret=ret+sin((2*it-1)*t)/(2*it-1);
   end
   ret=4/pi*ret;
end
fig=figure(1);
%set(fig,'papertype','a4')
nf=4
for it=1:nf
   subplot(nf,1,it);
   plot(xx,psum(xx,4*it));
   hold on;
   plot(xx,f(xx),'r');
   title(sprintf('n=%d',4*it));
end

print('negyszog','-depsc') ;


