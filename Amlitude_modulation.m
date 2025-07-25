clc
clear
Am=2;%input('Enter message signal amplitude: ');%message signal amplitude
Ac=4;%input('Enter carrier signal amplitude: ');%carrier signal amplitude
fm=10;%input('Enter message frequency: ');% fm<fc message signal frequency
fc=100;%input('Enter carrier frequency: ');%carrier signal frequency
%m=input('Enter modulation index: ');
m=Am/Ac;%modulation index
t1=0:0.0001:1;
y1=Am*sin(2*pi*fm*t1); % message signal
y2=Ac*sin(2*pi*fc*t1); % carrier signal
eq=(1+m.*y1).*(Ac.*sin(2*pi*fc*t1));%modulated signal
subplot(311);
plot(t1,y1);
xlabel('Time');
ylabel('Amplitude');
title('Message signal')
subplot(312)
plot(t1,y2);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal');
subplot(313);
plot(t1,eq);
plot(t1,eq,'r');
xlabel('Time');
ylabel('Amplitude');
title('Modulated signal');





