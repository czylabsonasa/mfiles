x=seq(-2, 3, 0.01)
x1=x[x<1]
y1=exp(x1)
x2=x[x>0.1]
y2=log(x2)
plot(
  x1,y1,
  type="l",
  ylim=c(-3,3),
  col="blue",
  asp=1
)

lines(
  x2,y2,
  #type="l",
  col="green"
)

lines(
  c(-3,3),
  c(-3,3),
  col="red"
)

title(main="exp, log és egyenes")