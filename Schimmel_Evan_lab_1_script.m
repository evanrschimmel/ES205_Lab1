clear all
close all
clc

load lab1data

Fin = 4; % N

Xss=xdata(end);
K=Xss/Fin;

Xp=max(xdata);
Tp=tdata(find(xdata==max(xdata),1));
pOS=((Xp-Xss)/Xss)*100;
zeta=sqrt( (log(pOS/100))^2 / ((log(pOS/100))^2 + pi^2 ));
omegaD=pi/Tp;
omegaN=omegaD/(sqrt(1-zeta^2));

mLab=(1/((omegaN^2)*K));
cLab=(2*zeta)/(omegaN*K);
kLab=1/K;

m = mLab; % kg
c = cLab; % N-s/m
k = kLab; % N/m

tf = 4; % s
maxstep = 0.01; % s
tol = 1e-6;

v0 = 0; % m/s
x0 = 0; % m

sim('Schimmel_Evan_lab_1_model')

figure
plot(t, x, 'k-', tdata, xdata, 'ob')
xlabel('Time (s)')
ylabel('Position (cm)')
set(gcf, 'color', 'w')
legend('Model', 'Data')