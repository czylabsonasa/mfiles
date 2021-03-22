zproba = function(X,mu0,sigma,alfa,jelleg){
  n=length(X)
  z=(mean(X)-mu0)*sqrt(n)/sigma

  if(jelleg=="bal"){
    c=-qnorm(1-alfa)
    if(z>c){return("H0")}else{return("H1")}
  }else{
    if(jelleg=="jobb"){
      c=qnorm(1-alfa)
      if(z<c){return("H0")}else{return("H1")}
    }else{
      c=qnorm(1-0.5*alfa)
      if(abs(z)<c){return("H0")}else{return("H1")}
    }
  }
}
