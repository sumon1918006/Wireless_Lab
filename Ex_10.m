clc;
clear;
close all;

% Sampling setup
fs = 100000;              % Sampling frequency (100 kHz)
t = 0:1/fs:0.01;          % Time vector from 0 to 10 ms

% Baseband signals for 3 users
s1 = sin(2*pi*100*t);     % User 1: 100 Hz
s2 = sin(2*pi*200*t);     % User 2: 200 Hz
s3 = sin(2*pi*300*t);     % User 3: 300 Hz

% Carrier frequencies for FDMA
f1 = 2000;                % User 1 carrier: 2 kHz
f2 = 6000;                % User 2 carrier: 6 kHz
f3 = 10000;               % User 3 carrier: 10 kHz

% Modulate each baseband signal using AM
mod1 = s1 .* cos(2*pi*f1*t);
mod2 = s2 .* cos(2*pi*f2*t);
mod3 = s3 .* cos(2*pi*f3*t);

% Combine all modulated signals (FDMA signal)
fdma_signal = mod1 + mod2 + mod3;

% Plotting
figure('Name','FDMA Signal Analysis','NumberTitle','off');

% Plot User 1 baseband signal
subplot(4,1,1);
plot(t, s1, 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('Amplitude');
title('User 1 Baseband Signal (100 Hz)');
grid on;

% Plot User 1 modulated signal
subplot(4,1,2);
plot(t, mod1,'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('Amplitude');
title('User 1 Modulated Signal (2 kHz Carrier)');
grid on;

% Plot combined FDMA signal
subplot(4,1,3);
plot(t, fdma_signal,'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Combined FDMA Signal (All Users)');
grid on;

% Frequency Domain Analysis using FFT
n = length(fdma_signal);
f = (-n/2:n/2-1)*(fs/n);                 % Frequency axis
fdma_fft = abs(fftshift(fft(fdma_signal)));  % FFT magnitude

% Plot FDMA signal in frequency domain
subplot(4,1,4);
plot(f, fdma_fft, 'LineWidth', 1.2);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('FDMA Signal in Frequency Domain');
xlim([0 15000]);  % Zoom in on positive frequencies
grid on;
