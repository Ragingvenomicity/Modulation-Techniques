clc;
clear all;
close all;
Am=2;Ac=5;fm=5;fc=50;
fs=10*fc;
mi=0.5;t=0:1/fs:1;
Sm=Am*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t,Sm);
xlabel('Time'); ylabel('Amplitude'); title('MessageSignal'); 
Sc=Ac*sin(2*pi*fc*t); subplot(4,1,2);
plot(t,Sc);
xlabel('Time'); ylabel('Amplitude'); title('CarrierSignal');
Sam=Ac*(1+mi*sin(2*pi*fm*t)).*sin(2*pi*fc*t); subplot(4,1,3);
plot(t,Sam);xlabel('Time'); ylabel('Amplitude'); title('AMSignal'); 
v1=Sam.*Sc;
[b,a]=butter(2,2*(fm/fs),'low'); 
Sde = filter(b,a,v1); subplot(4,1,4);plot(t,Sde);xlabel('Time'); ylabel('Amplitude'); title('Demodulatedsignal'); 
grid on;
N_pt=1024;
AMN=awgn(Sam,20);
figure
plot(t,AMN);
Snde=filter(b,a,(AMN.*Sc));
figure
plot(t,Snde);
SFM=fft(Sam,N_pt); 
figure
plot((fs./2)*linspace(0,1,N_pt./2),abs(SFM(1:N_pt./2)));
