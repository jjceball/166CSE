%% Homework 4 Prog 2
close all

%% Part A
sigma = 3;

x = -16:15; 

gauss = exp(-x.^2/(2*(sigma*2)));

plot(gauss);

f = [1, -1, 0];

F = conv(gauss, f, 'same');

F2 = conv(F, f, 'same');

F3 = conv(F2, f, 'same');

figure;
plot(F3);

FT = fft(F3);

figure;
plot(fftshift(abs(FT)));

%% Part B




