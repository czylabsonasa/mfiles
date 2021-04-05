function pz=mhorner(p,z)
  pz = p(1) ;
  for i=2:length(p)
    pz = pz*z+p(i) ;
  end
end


% a variant:
% function pz=myhorner2(p,z)
%  pz = p(1) ;
%  for pi=p(2:end)
%    pz = pz*z+pi ;
%  end
%end


% a vectorized version - behaves similar to that of polyval
%function pz=myhorner3(p,z)
%  pz = p(1)*ones(size(z)) ;
%  for pi=p(2:end)
%    pz = pz.*z+pi ;
%  end
%end