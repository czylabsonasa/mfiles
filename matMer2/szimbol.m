% szimbolikus alapok

clear ;

% egyenletek megoldasa

% syms x ;
% equ = 3*x + 10 == 0 ;
% sol = solve(equ, x) ;

% syms x y ; % nincs vessző
% equ = 3*x + 2*y + 10 == 0 ;
% sol = solve(equ, x) ;

% syms x y ; % nincs vessző
% equ = [3*x + 2*y + 10; 2*x - y + 3] == [0;0] ;
% sol = solve(equ, [x;y]) ; % struct-ot ad vissza x es y mezokkel
% sol.x, sol.y

% deriválás 

% syms f(x) ;
% % f(x) = sin(x) + x^2 ;
% % f(x) = x^x + x^2 ;
% sol = diff(f,x) ;
% sol


% syms f(x,y) ;
% f(x,y) = sin(x*y);
% solx = diff(f,x) ;
% soly = diff(f,y) ;
% solx, soly
% % használhatók numerikus számolásokra is:
% numx = matlabFunction(solx) ;
% numy = matlabFunction(soly) ;
% numx(10,2), numy(10,2)


% % integrálás
% syms y(t) ;
% equ = diff(y,t) == sin(t)+exp(t) ; % a jobboldal az integrandus
% sol = dsolve(equ) ;
% sol

% % kezdeti feltétel
% syms y(t) ;
% equ = diff(y,t) == sin(t)+exp(t) ; % a jobboldal az integrandus
% sol = dsolve(equ, y(0) == 0) ;
% sol
% % a numerikus változattal lehet tovább dolgozni
% num = matlabFunction(sol) ;


% bonyolultabb integrálás + kezdeti feltétel 
syms y(t) ;
equ = diff(y,t) == y + t ; % a jobboldal az integrandus
sol = dsolve(equ, y(0) == 0) ;
sol
% a numerikus változattal lehet tovább dolgozni
num = matlabFunction(sol) ;
xx = linspace(-1,1) ;
plot(xx, num(xx)) ;

