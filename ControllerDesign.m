s =tf('s');

G = (1.826e14*s-1.033e17)/(s^4-4.732e04*s^3 -3.632e09*s^2 - 6.192e11*s -3.446e14);
%bode(G)
%step(G)

%Diseño Controlador Atraso Reto2

G2 = 1.696e10 /(s^3+647.5*s^2+1.768e05*s+4.979e07);


error=0.04;
[mag0,phase0] = bode(G2,0);
K=((1/error)-1)/mag0;
Wg=2565.3369;
alpha = 10^(-22.2/20);
T = 1/(alpha*Wg);
cita=(45/100);
Spico = exp((pi*cita)/(sqrt(1-cita^2)));

Catraso = tf(K*[alpha*T 1],[T 1]);

%//// FIN informe Reto 2


%{
% generate a frequency vector and response data 
freqp = logspace(1,2);
respp = .05*(freq).*exp(i*2*freq);
% Create a FRD model
sysp = frd(resp,freq);
%}
%tf = tfest(frd_2,2,0); 
s =tf('s');
model = (1007*s-4404)/(s^2-4.358*s-29.02);
%step(tf)
%sisotool(tf)
G=model;
WgD=421*180/pi;
PMD=30;
[mag,phase]=bode(G,WgD*pi/180);
%bode(G)
%sisotool(G)
phim = PMD -180-phase;
alpha = (1+sin(phim))/(1-sin(phim));
T1 = 1/(WgD*sqrt(alpha));
C1= tf([alpha*T1 1],[T1 1]);
bode(C1*G);

%{
alfa = (1+sin(phim*pi/180))/(1-sin(phim*pi/180));
T1 = 1/(WgD*sqrt(alfa));

[mag1,phase1]= bode(C1*G, WgD);

k=1/mag1;
C_adel =k*C1;
bode(C_adel*G)
%}






