function ret=mytrap(f, a,b, m)
  ret=(b-a)/m*(sum(f(linspace(a,b,m+1)))-0.5*(f(a)+f(b)));
end