x0=[-2,3]';

%feladat=fROSENBROCK();
feladat=fFERMATWEBER([1,2; 3,4; 5,6; 7,8]');
%feladat=fCUBIC1();

fprintf("####################################\n");
uFMS(feladat,x0);

% fprintf("####################################\n");
% uNEWTON(feladat,x0);

% fprintf("####################################\n");
% uLEVMAR(feladat,x0);

% fprintf("####################################\nlsFMU\n");
% uNEWTONLS(feladat,x0,@lsFMU,1);

% fprintf("####################################\nlsBT\n");
% uNEWTONLS(feladat,x0,@lsBT,1);

%fprintf("####################################\nlsFMU\n");
%uGRADIENTLS(feladat,x0,@lsFMU,1);

fprintf("####################################\nlsARM\n");
uGRADIENTLS(feladat,x0,@lsARM,0.03);

% fprintf("####################################\nlsBT\n");
% uGRADIENTLS(feladat,x0,@lsBT,0.1);
