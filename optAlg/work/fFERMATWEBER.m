function ret=fFERMATWEBER(pontok)
  % https://en.wikipedia.org/wiki/Weber_problem


  % név
  ret.name="2d-elhelyezés - minimális össztávolság (2 normában)" ;

  numvar=2 ;
  ret.numvar=numvar ;
  
  % pontok=[2.5 0; 0 0; 4 3; 1 4]' ;

  % fuggvenyes resz
  f = @(x,y) ff(x,y,pontok);
  fV = @(v) ffV(v,pontok) ;
  dfV =@(v) dffV(v,pontok);
  % ide meg kellene a d2fv is
  
  ret.f=f ;
  ret.fV=fV ;
%   ret.dfx=dfx ; % ezeket nem nagyon hasznaljuk kulon
%   ret.dfy=dfy ;
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

function val=ffV(v,pt)
  val=sum(sqrt(sum( (v-pt).^2) ));
end

function val=dffV(v,pt)
  nrm = sqrt(sum((v-pt).^2));
  val=sum( (v-pt) ./ nrm , 2);
end

function val=dffxy(x,y,pt)
  val=dffV([x;y],pt) ;
end


function val=ffxy(x,y,pt)
  val=ffV([x;y],pt);
end

function val=ff(X,Y,pt)
  XX=X(:);
  YY=Y(:);
  n=length(XX);
  val=zeros(n,1);
  for i=1:n
    val(i)=ffV([XX(i);YY(i)], pt);
  end
  val=reshape(val,size(X)) ;
end
