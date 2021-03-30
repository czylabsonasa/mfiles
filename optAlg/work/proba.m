x0=[2,2]';
feladat=fCUBIC2();
uNEWTON(feladat,x0);
%uNEWTONLS(feladat,x0,@lsFMU,0);
%uNEWTONLS(feladat,x0,@lsBT,1);
%uGRADIENTLS(feladat,x0,@lsFMU);
uGRADIENTLS(feladat,x0,@lsBT,0.01);
