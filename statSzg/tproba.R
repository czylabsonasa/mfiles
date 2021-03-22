tproba = function(X,mu0,alfa,jelleg){
  n=length(X)
  tval=(mean(X)-mu0)*sqrt(n)/sd(X)
  print(tval)
  if(jelleg=="bal"){
    c=-qt(1-alfa,n-1)
    if(tval>c){return("H0")}else{return("H1")}
  }else{
    if(jelleg=="jobb"){
      c=qt(1-alfa,n-1)
      if(tval<c){return("H0")}else{return("H1")}
    }else{
      c=qt(1-0.5*alfa,n-1)
      if(abs(tval)<c){return("H0")}else{return("H1")}
    }
  }
}
