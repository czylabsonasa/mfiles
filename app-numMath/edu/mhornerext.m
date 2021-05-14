function pz=mhornerext(p,t,z)
  pz = p(1) ;
  for i=2:length(p)
    pz = pz*(z-t(i))+p(i) ;
  end
end