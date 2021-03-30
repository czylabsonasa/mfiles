function pTRACEPATH(feladat,xx)
  if not(feladat.numvar==2)
    fprintf("csak kétváltozós, valós függvényre!");
    return;
  end

  f=feladat.ff ;

  clf ;
  clc ;
  xmin=min(xx(1,:))-1; xmax=max(xx(1,:))+1;
  dx=max(0.1*max(abs(xmin),abs(xmax)),1);

  ymin=min(xx(2,:))-1; ymax=max(xx(2,:))+1;
  dy=max(0.1*max(abs(ymin),abs(ymax)),1);

  xb=linspace(xmin-dx,xmax+dx,30);
  yb=linspace(ymin-dy,ymax+dy,30);

  [X,Y] = meshgrid(xb, yb) ;
  contour(X,Y,f(X,Y)) ;
  axis square ;
  hold on ;
  tit = sprintf('(%.3f,%.3f)',xx(1,1),xx(2,1));
  title(tit) ;

  x0 = xx(:,1);
  plot(x0(1),x0(2), 'or') ; axis square ;
  for x1=xx(:,2:end)
    clc ;
    fprintf('\npress a key to continue\n\n') ;
    pause ;
    plot([x0(1),x1(1)], [x0(2),x1(2)], '-xk') ; 
    axis square ;
    x0 = x1 ;
  end

end
