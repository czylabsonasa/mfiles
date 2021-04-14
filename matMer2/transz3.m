clear;
clf;
xx=1:0.003:10;


% atvisz =@(a,b,A,B,t) A+(B-A)/(b-a)*(t-a);
% txx=atvisz(2,8,-pi,pi,xx);% a feladatbeli intervallum
txx=pi/3*xx-5*pi/3;

% https://ch.mathworks.com/help/symbolic/piecewise.html
syms x;
y=piecewise(2<x<5,1,x==5,3,5<x<8,5);

figure(1)
nf=3;
for it=1:nf
   subplot(nf,1,it);
   eddig=4*it;
   plot(xx,2*psum(txx,eddig)+3);
   hold on;
   fplot(y);
   title(sprintf('n=%d',eddig));
end

figure(2)
nf=3;
for it=1:nf
   subplot(nf,1,it);
   plot(xx,2*psum2(xx,4*it)+3);
   hold on;
   fplot(y);
   title(sprintf('másik n=%d',4*it));
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
