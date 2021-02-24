function y=ddfun3(x)
  y = zeros(size(x)) ;
  id = x<3 ;
  y(id) = 2 ;
  id = not(id) ;
  y(id) = -2.0 ./ (x(id)-2).^2 ;
end
