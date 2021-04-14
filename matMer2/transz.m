clf;
xx=1:0.003:10;

fig=figure(1);

% atvisz =@(a,b,A,B,t) A+(B-A)/(b-a)*(t-a);

txx=pi/3*xx-5*pi/3;
% atvisz(2,8,-pi,pi,xx);% a feladatbeli intervallum

nf=3;
for it=1:nf
   subplot(nf,1,it);
   plot(xx,2*psum(txx,4*it)+3);
   hold on;
   plot(xx,2*f(txx)+3,'r');
   title(sprintf('n=%d',4*it));
end



function ret=f(t)
   ret=(-1).^floor(t/pi);
end

function ret=psum(t,n)
   ret=zeros(size(t));
   for it=1:n
      ret=ret+sin((2*it-1)*t)/(2*it-1);
   end
   ret=4/pi*ret;
end
