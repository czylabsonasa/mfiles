function ret=myplacement1(pontok)
  % név
  ret.fname="2d-elhelyezés - minimális össztávolság (2 normában)" ;

  numvar=2 ;
  ret.numvar=numvar ;
  
  % pontok=[2.5 0; 0 0; 4 3; 1 4]' ;

  % fuggvenyes resz
  f = @(x,y) ff(x,y,pontok);
  fV = @(v) ffV(v,pontok) ;
  dfV =@(v) dffV(v,pontok);
  
  ret.f=f ;
  ret.fV=fV ;
  ret.dfV=dfV ;
  
  % a tartomany
  xmin = min(pontok(1,:))-1 ;
  xmax = max(pontok(1,:))+1 ;
  xb = linspace(xmin,xmax,50) ;
  ymin = min(pontok(2,:))-1 ;
  ymax = max(pontok(2,:))+1 ;
  yb = linspace(ymin,ymax,50) ;


  ret.xmin = xmin ; 
  ret.xmax = xmax ;
  ret.xb = xb ;
  ret.ymin = ymin ; 
  ret.ymax = ymax ;
  ret.yb=yb ;

end

% a fv definíciója vektor helyen 
function val=ffV(v,pt)
end

% a fv definíciója 2 valtozos esetben
function val=ffxy(x,y,pt)
end

% gradiens
function val=dffV(v,pt)
end



% X,Y lehet vektor-matrix
function val=ff(X,Y,pt)
end
