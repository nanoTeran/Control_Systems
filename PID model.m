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





