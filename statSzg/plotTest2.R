xx = seq(-pi,pi,0.1)

plot(
  xx, cos(xx),
  xlim=c(-4,4),
  ylim=c(-1.5,1.5),
  type="l",
  col="blue",
  xlab="x",
  ylab="y"
)

# par(new=TRUE)

plot(
  xx, cos(2*xx),
  xlim=c(-4,4),
  ylim=c(-1.5,1.5),
  type="l",
  col="red",
  xlab="",
  ylab="",
)


legend(
  # -4,1.5, 
  "topleft",
  legend=c("cos(x)", "cos(2x)"), 
  col=c("blue","red"), 
  lty=1
)



