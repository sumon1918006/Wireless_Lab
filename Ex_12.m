clc; 
clear; 
% Binary data for 2 users (1 = +1, 0 = -1) 
data_user1 = [1 -1 1 -1];  % bits 
data_user2 = [1 1 -1 -1]; 
% Walsh codes (orthogonal) 
code_user1 = [1 1 1 1]; 
code_user2 = [1 -1 1 -1]; 
% Length of one bit in time units 
bit_len = length(code_user1); 
% Spread signals 
spread_user1 = kron(data_user1, code_user1);  % user1 signal spreading 
spread_user2 = kron(data_user2, code_user2);  % user2 signal spreading 
% CDMA combined signal (simultaneous transmission) 
cdma_signal = spread_user1 + spread_user2; 
% Receiver tries to decode user1 
recv_user1 = cdma_signal .* repmat(code_user1, 1, length(data_user1)); 
decoded_user1 = []; 
for i = 1:bit_len:length(recv_user1) 
avg = sum(recv_user1(i:i+bit_len-1))/bit_len; 
decoded_user1 = [decoded_user1, sign(avg)]; 
end 
% Receiver tries to decode user2 
recv_user2 = cdma_signal .* repmat(code_user2, 1, length(data_user2)); 
decoded_user2 = []; 
for i = 1:bit_len:length(recv_user2) 
avg = sum(recv_user2(i:i+bit_len-1))/bit_len; 
decoded_user2 = [decoded_user2, sign(avg)]; 
end 
% Display results 
disp('Original Data User 1:'); disp(data_user1); 
disp('Decoded Data User 1:'); disp(decoded_user1); 
disp('Original Data User 2:'); disp(data_user2); 
disp('Decoded Data User 2:'); disp(decoded_user2); 
% Plotting 
figure; 
subplot(3,1,1); 
plot(cdma_signal, 'LineWidth', 2); 
title('Combined CDMA Signal'); 
xlabel('Chip Index');  
ylabel('Amplitude'); 
subplot(3,1,2); 
stem(decoded_user1, 'filled'); title('Decoded Signal - User 1'); 
ylim([-1.5 1.5]); 
subplot(3,1,3); 
stem(decoded_user2, 'filled'); title('Decoded Signal - User 2'); 
ylim([-1.5 1.5]);