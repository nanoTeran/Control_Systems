% usar este para ver los bodes y eso pal informe

load caracterizacion.txt;
times = caracterizacion(:,1);
input = caracterizacion(:,2);
output = caracterizacion(:,3);


s= tf('s');
Kp = -7.2716;
Tp1= 2.056;
G=Kp/(1+Tp1*s);

C1 = 0.862*(s+0.8352)/s;
C2 = 0.2*(s+0.8352)/s;
