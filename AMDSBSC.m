
clc;
clear all; close all;
Am=2; Ac=5;
fm=5; fc=50;
fs = 10*fc; t=0:1/fs:1; mi=0.5;
m=Am*sin(2*pi*fm*t);
c=Ac*sin(2*pi*fc*t);s=m.*c;
r =s.*c;
[b,a]=butter(2,2*(fm/fs),'low'); 
d = filter(b,a,r);
subplot(4,1,1),plot(t,m); xlabel('time'); ylabel('amplitude'); title('MODULATINGSIGNAL');
subplot(4,1,2),plot(t,c) ;xlabel('time'); ylabel('amplitude'); title('CARRIERSIGNAL');
subplot(4,1,3),plot(t,s) ;xlabel('time'); ylabel('amplitude'); title('DSBSCMODULATEDSIGNAL');
subplot(4,1,4),plot(t,d) ;xlabel('time(sec)'); ylabel('amplitudeinvolts(V)'); title('DEMODULATEDSIGNAL'); N_pt=1024;
AMN=awgn(r,20);
figure
plot(t,AMN);
Snde=filter(b,a,(AMN.*c));
figure
plot(t,Snde);

SFM=fft(r,N_pt); figure
plot((fs./2)*linspace(0,1,N_pt./2),abs(SFM(1:N_pt./2)))
