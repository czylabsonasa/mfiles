function ret=mytrap(f, a,b, m)
  ip=linspace(a,b,m+1);
  ip=ip(2:end-1);
  ret=(b-a)/m*(0.5*f(a)+sum(f(ip))+0.5*f(b));
end