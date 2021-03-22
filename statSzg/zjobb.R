# Z-próba, jobboldali
X=c(196,202,198,197,190)
# X=c(499,525,498,503,501,497,493,496,500,495,515)
alfa=0.02 
sigma=4
mu0=200

n=length(X)

z=(mean(X)-mu0)*sqrt(n)/sigma
# print(z)
c=qnorm(1-alfa)
print(z<c)
