X = c(1,1,3,2,6,5,1)
res=c(
  átlag=mean(X),
  szórás=sd(X),
# print(sqrt(sum((X - mean(X))^2)/6))
  medián = median(X),
  quantile(X,0.25),
  quantile(X,0.75)
)

print(res)