function pz=myhorner(p,z)
  pz = p(1) ;
  for i=2:length(p)
    pz = pz*z+p(i) ;
  end
end