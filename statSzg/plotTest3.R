xx = seq(-pi,pi,0.1)


plot(
  xx, cos(xx),
  xlim=c(-4,4),
  ylim=c(-1.5,1.5),
  type="l",
  col="blue",
  xlab="x",
  ylab="f(x)"
)

par(new=TRUE)

plot(
  xx, cos(2*xx),
  xlim=c(-4,4),
  ylim=c(-1.5,1.5),
  type="l",
  col="red",
  xlab="",
  ylab="",
)

par(new=TRUE)
plot(
  xx, cos(3*xx),
  xlim=c(-4,4),
  ylim=c(-1.5,1.5),
  type="l",
  col="green",
  xlab="",
  ylab="",
)


legend(
  -4,1.5, # ez lehet string is: pl "topleft"
  legend=c("cos(x)", "cos(2x)","cos(3x)"), 
  col=c("blue","red","green"), 
  lty=1
)



