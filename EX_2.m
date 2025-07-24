t=0:0.001:1;
fm=3; % modulating signal
fc=50; %carrier signal
b=10; % frequency deviation
x=sin(2*pi*fm*t); % modulating signal
y=cos(2*pi*fc*t); %carrier signal
z=(cos((2*pi*fc*t)+(b*x)));
%% Message signal plot
subplot(3, 1, 1);
plot(t, x);
xlabel('time(sec)')
ylabel('Amplitude(V)')
title('MODULATING SIGNAL')
%% Carrier signal plot
subplot(3, 1, 2);
plot(t,y);
xlabel('time(sec)')
ylabel('Amplitude(V)')
title('CARRIER SIGNAL')
%% Modulated signal plot
subplot(3, 1, 3);
plot(t, z);
xlabel('time(sec)')
ylabel('Amplitude(V)')
title('FREQUENCY MODULATED SIGNAL')
