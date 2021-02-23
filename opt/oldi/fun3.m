function y=fun3(x)
  y = zeros(size(x)) ;
  id = x<3 ;
  y(id) = (x(id)-2).^2 ;
  id = not(id) ;
  y(id) = 2.0*log(x(id)-2)+1 ;
end
