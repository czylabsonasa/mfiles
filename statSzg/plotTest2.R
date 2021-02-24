xx = seq(-pi,pi,0.1)


plot(
  xx, sin(xx),
  xlim=c(-4,4),
  ylim=c(-1.5,1.5),
  type="l",
  col="blue",
  xlab="x",
  ylab="f(x)"
)

par(new=TRUE)
plot(
  xx, cos(xx),
  xlim=c(-4,4),
  ylim=c(-1.5,1.5),
  type="l",
  col="red",
  xlab="",
  ylab="",
)

legend(-4,1.5, legend=c("sin", "cos"), col=c("blue","red"), lty=1)



