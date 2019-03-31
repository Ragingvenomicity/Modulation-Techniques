clc;
clear all; close all; 
fs=1./0.001;
fm=input('Messagefrequency='); fc=input('Carrierfrequency='); mi=input('Modulationindex='); 
t=0:0.0001:0.1;
m=sin(2*pi*fm*t); subplot(4,1,1);
plot(t,m);
xlabel('time'); ylabel('amplitude'); title('Messagesignal'); grid on
c=sin(2*pi*fc*t); subplot(4,1,2);
plot(t,c);
xlabel('time'); ylabel('amplitude'); title('Carriersignal'); grid on
y=sin(2*pi*fc*t+(mi.*sin(2*pi*fm*t))); x=awgn(y,25);
subplot(4,1,3);
plot(t,y);
xlabel('time'); ylabel('amplitude'); title('FMsignal'); subplot(4,1,4);
plot(t,x);
xlabel('time'); ylabel('amplitude');
title('FMsignalwithnoise'); grid on
N_pt=1024; y1=fft(y,N_pt);
figure 
ylabel('amplitude'); title('spectrum');plot((fs./2)*linspace(0,1,N_pt./2),abs(y1(1:N_pt./2)));
