% vektorized version - behaves similar to that of polyval
function pz=myhorner3(p,z)
  pz = p(1)*ones(size(z)) ;
  for pi=p(2:end)
    pz = pz.*z+pi ;
  end
end