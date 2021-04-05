x0=[-2,3]';

%feladat=fROSENBROCK();
fun=fFERMATWEBER([1,2; 3,4; 5,6; 7,8]');
%feladat=fCUBIC1();

fprintf("####################################\n");
uFMS(fun,x0);

% fprintf("####################################\n");
% uNEWTON(fun,x0);

% fprintf("####################################\n");
% uLEVMAR(fun,x0);

% fprintf("####################################\nlsFMU\n");
% uNEWTONLS(fun,x0,@lsFMU,1);

% fprintf("####################################\nlsBT\n");
% uNEWTONLS(fun,x0,@lsBT,1);

%fprintf("####################################\nlsFMU\n");
%uGRADIENTLS(fun,x0,@lsFMU,1);

%fprintf("####################################\nlsARM\n");
%uGRADIENTLS(fun,x0,lsARM(),1);

fprintf("####################################\n");
uGRADIENTLS(fun,x0,lsFMU(),1);
