function hRESULT(feladat,flag,niter,xx)
% algoritmusok végén az eredmények kiírásához segédfv.

  x0=xx(:,1);
  xopt=xx(:,end);
  fxopt=feladat.f(xopt);
  dfxopt=feladat.df(xopt);

  fprintf("\nfeladat=%s\n",feladat.name);
  fprintf("\nx0=(%s)\n", tostr(x0)) ;
  
  fprintf("\nflag=%s niter=%.0f\n", flag, niter) ;
  fprintf("\nxopt=(%s)    fxopt=%.3f    |dfxopt|=%.3f\n", tostr(xopt) , fxopt,  norm(dfxopt)) ;
  fprintf("\n") ;
  
end

function ret=tostr(vek)
  tmp=[];
  n=length(vek);
  for it=1:n
    tmp=[tmp,sprintf("%.3f", vek(it))];
  end
  ret=strjoin(tmp,', ');
end
