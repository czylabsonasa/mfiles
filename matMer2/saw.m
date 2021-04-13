clf;

xx=-5:0.03:5;


nf=3
for it=1:nf
   subplot(nf,1,it);
   eddig=40*it;
   plot(xx,psum(xx,eddig));
   hold on;
   plot(xx,f(xx),'r');
   title(sprintf('n=%d',eddig));
end


function ret=f(t)
  ff=@(x) x-floor(x);
  ret=2*pi*ff(0.5/pi*(t+pi))-pi;
end


function ret=psum(t,n)
   ret=zeros(size(t));
   s=1;
   for it=1:n
      ret=ret+s*sin(it*t)/it;
      s=-s;
   end
   ret=2*ret;
end
