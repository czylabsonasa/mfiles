B=[12 8 -2 5; 8 14 -13 12;-2 -13 18 -8; 5 12 -8 31];

n=length(B);
%A=randi(4,2,2)
%B=A+A'
%C=A'*A
eig(B)
v=rand(n,1)
for k=1:10
  v=B*v; %/norm(B*v);
  v=v/norm(v);
end
v
l=(B*v)'*v % /(v'*v)

norm(B*v-l*v)
