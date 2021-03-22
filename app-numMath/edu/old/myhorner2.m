function pz=myhorner2(p,z)
  pz = p(1) ;
  for pi=p(2:end)
    pz = pz*z+pi ;
  end
end