% sin(pi)^2+cos(pi)^2
% exp(1)
% log(exp(2))
% 1+2+3+4
% abs(-pi) % a PI beépített konstans
% 
% 
% v1=[1,2,3] % 1x3-as sorvektor
% v2=[-1,0,-3]
% abs(v2) % elemenkénti abszolútérték
% sin(pi*v2) % ahol nullát kellene látni ott néha nem az van
% v1+v2 % +,- esetén a vektoroknál szokásos elemenkénti végrehajtás
% v1*v1 % hiba, nem szorozhatók össze
% 
% 
% v1.*v1 % így már ok
% % ' aposztróf: transzponálás
% v1*v1' % így is, hiszen 1x3 3x1 szorzat=belső szorzat
% 
% 
% A=[ 1,2,3 ; 4,5,6 ];
% B=A+1
% C=[ 3,2,1; 6,5,4 ];
% A+C
% A*B % hiba, nem szorozhatók össze
% 
% 
% A.*B % elemenkénti szorzás
% A./B % elemenkénti osztás
% A*B' % 2x3 3x2 ok
% 
% 
% 
% % szabályos vektorok megadása
% v=-3:3 % bal:jobb, alaplépésköz=1 
% w=-3:1.1:3 % bal:lépésköz:jobb
% 
% 
% % vektorok mátrixok elemeinek kiválasztása
% % az elsőtől kezdve minden második elem:
% v(1:2:end) % end: kontextusfüggő, utolsó elem
% % az elsőtől kezdve minden második oszlop:
% A(:,1:2:end)
% 
% 
% % bal,jobb, ekvidisztáns pontok száma (alapban 100)
% linspace(-3,3,7)
% linspace(-3,3,3)
% 
% 
% 
% v=10:-1:1;
% A=[1,2,3;4,5,6];
% length(v)
% sum(v)
% length(A)
% sum(A) % oszlopösszegek sorvektora
% sum(A,dim=1)
% sum(A,dim=2)
% size(A)
% size(v)
% size(A') % transzponálás
% 
% 
% v=1.1*ones(1,3) % sorok,oszlopok
% z=zeros(1,3)
% zeros(3) % egy paraméter -> négyzetes mátrix
% eye(2)
% eye(2,3)
% 
% 
% v=1:5;
% v([3,4,5])=v([4,5,3]) % sorrend változtatás
% A=eye(3);
% A([1,2],:)=A([2,1],:) % sorcsere
% A(:,[2,3])=A(:,[3,2]) % oszlopcsere
% 
% 
% A=randi(5,3,3)-2 % véletlen egész elemű mátrix 1...max, sor, oszlop
% diag(A)
% diag(A,1) % 1-el feljebb mint a diagonális
% diag(A,-1) % 1-el lejebb mint a diagonális
% triu(A) % diagonális alatt nulla
% tril(A) % diagonális felett nulla
% 
% 
% % tudjuk a lépésszámot:
% s=0;
% for k=1:10
%     s=s+k;
% end
% s
% 
% % nem feltétlen tudjuk a lépésszámot:
% s=0;
% k=1;
% while s<50
%     s=s+k;
%     k=k+1;
% end
% s
% 
% % szelektálni akarunk:
% s=0;
% for k=1:10
%     if mod(k,3)==2
%         s=s+k;
%     end
%     k=k+1;
% end
% s
% % az előzővel ekvivalens (és egyszerűbb):
% s=0;
% for k=2:3:10
%     s=s+k;
% end
% s
% 
% % csak egy matematika kifejezés a függvény:
% fun1=@(x) sin(pi*x)-cos(pi*x);
% fun1([-1,0,1])
% % valamilyen tevékenységet is végez:
% function y=fun2(x)
%     y=abs(x)+1;
%     while y>1
%         y=y/2;
%     end
% end
% fun2(10)
% fun2(1)
% 
% 
% xx=linspace(0,2*pi);
% f1=@(x) sin(x);
% f2=@(x) sin(2*x);
% plot(xx,f1(xx),';f1;',xx,f2(xx),';f2;')
% 
% 
