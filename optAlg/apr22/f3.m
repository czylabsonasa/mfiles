clear;
clf;
close all;

A=imread('lena512.pgm');

figure; 

% A(1:3,1:3)

A=double(A)/255;

[p,p]=size(A) % 512x512

[U,S,V]=svd(A);

S(end-3:end,end-3:end)

% a szingularis ertekek csokkenoleg vannak S-ben

figure(1);
imshow(A);
title('100% - eredeti')

perc=[100,50,10,5,1];
nf=length(perc);
for k=2:nf
  prc=perc(k)
  S=zeroit(S,floor(prc/100*p));
  figure(k);
  imshow(U*S*V');
end

%diag(S)

function S=zeroit(S,a)
  b=length(S);
  while a<=b
    S(a,a)=0;
    a=a+1;
  end
end
