clf;
xx=1:0.003:10;


atvisz =@(a,b,A,B,t) B+(B-A)/(b-a)*(t-a);
txx=atvisz(2,8,-pi,pi,xx);% a feladatbeli intervallum

figure(1)
nf=3;
for it=1:nf
   subplot(nf,1,it);
   plot(xx,2*psum(txx,4*it)+3);
   hold on;
   plot(xx,2*f(txx)+3,'r');
   title(sprintf('n=%d',4*it));
end

figure(2)
nf=3;
for it=1:nf
   subplot(nf,1,it);
   plot(xx,2*psum2(xx,4*it)+3);
   hold on;
   plot(xx,2*f(txx)+3,'r');
   title(sprintf('másik n=%d',4*it));
end


% print('transz','-depsc') ;


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

function ret=psum2(t,n)
  ret=zeros(size(t));
  a=pi/3;
  C=[1/2,-1,1/2]; 
  S=[sqrt(3)/2,0,-sqrt(3)/2];
  j=1;
  for it=1:n
    ret=ret+...
      C(j)*sin(a*(2*it-1)*t)/(2*it-1)+S(j)*cos(a*(2*it-1)*t)/(2*it-1);
    j=j+1;
    if j>3, j=1; end
  end
  ret=4/pi*ret;
end
