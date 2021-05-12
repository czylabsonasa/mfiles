% linprog experiments


nvar=4;

Ale=[]; ble=[];

Aeq=[... 
  1 1 9  5;...
  3 5 0  8;...
  2 0 6 13 ...
];

beq = [7; 3; 5];

Age=[...
  2 10   10 4 ...
];

bge=[...
  9 ...
];




A=[Ale; -Age]; b=[ble; -bge];

c = [1; 3; 5; 2];

[loc,val]=linprog(c,A,b,Aeq,beq,zeros(nvar,1),[])


