lista={} ;
clear s ;

s.rajz=           'egyeske.pdf' ;
s.symf=            diff(y,t) == y+t+sin(t) ;
s.numf=           @(t,y) y+t+sin(t) ;
s.xx=                linspace(-3,3) ;
s.tb=                 -3:3 ;
s.yb=                -3:10 ;
s.IVPS=              [   -3      -3     -3 ;
                              2.5    2.7   3.1 ] ;
lista{1}=s ;
clear s ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s.rajz=           'ketteske.pdf' ;
s.symf=            diff(y,t) == -y+t+t^2 ;
s.numf=           @(t,y) -y+t+t.^2 ;
s.xx=                linspace(-3,2) ;
s.tb=                 -3:0.5:3 ;
s.yb=                -2:6 ;
s.IVPS=              [   -3      -3     -3 ;
                                -2       1      5 ] ;
lista{2}=s ;
clear s ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
