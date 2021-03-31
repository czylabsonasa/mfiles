function ret=fFERMATWEBER(pontok)
  % https://en.wikipedia.org/wiki/Weber_problem


  % név
  ret.name="2d-elhelyezés - minimális össztávolság (2 normában)" ;

  numvar=2 ;
  ret.numvar=numvar ;
  
  % pontok=[2.5 0; 0 0; 4 3; 1 4]' ;

  % fuggvenyes resz
  ff = @(x,y) F(x,y,pontok);
  f = @(v) Fv(v,pontok) ;
  df =@(v) dFv(v,pontok);
  % ide meg kellene a d2fv is
  
  ret.ff=ff ;
  ret.f=f ;
%   ret.dfx=dfx ; % ezeket nem nagyon hasznaljuk kulon
%   ret.dfy=dfy ;
  ret.df=df ;
  
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

function val=Fv(v,pt)
  val=sum(sqrt(sum( (v-pt).^2) ));
end

function val=dFv(v,pt)
  nrm = sqrt(sum((v-pt).^2));
  val=sum( (v-pt) ./ nrm , 2);
end

function val=dFxy(x,y,pt)
  val=dFFv([x;y],pt) ;
end


function val=Fxy(x,y,pt)
  val=Fv([x;y],pt);
end

function val=F(X,Y,pt)
  XX=X(:);
  YY=Y(:);
  n=length(XX);
  val=zeros(n,1);
  for i=1:n
    val(i)=Fv([XX(i);YY(i)], pt);
  end
  val=reshape(val,size(X)) ;
end

