function ret=fFERMATWEBER(pontok)
  % https://en.wikipedia.org/wiki/Weber_problem


  % név
  ret.name="2d-elhelyezés - minimális össztávolság (2 normában)" ;

  numvar=2 ;
  ret.numvar=numvar ;
  
  % pontok=[2.5 0; 0 0; 4 3; 1 4]' ;

  % fuggvenyes resz
  ret.ff = @(x,y) F(x,y,pontok);
  ret.f = @(v) Fv(v,pontok) ;
  ret.df =@(v) dFv(v,pontok);

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

