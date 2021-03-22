# Z-próba, kétoldali
X=c(499,525,498,503,501,497,493,496,500,495)
alfa=0.05
sigma=3
mu0=500

n=length(X)

z=(mean(X)-mu0)*sqrt(n)/sigma
# print(z)
c=qnorm(1-0.5*alfa)
print(abs(z)<c)
