%% hw2 prog4 Part(a)
close all

% Padded first difference kernel
f        = [0.5 0 -0.5 0 0 0 0 0];
x        = 0:7;
    
% Perform DFT and plot
F        = fft(f);
Fc       = fftshift(F);
S        = abs(Fc);
phase    = angle(Fc);

figure;
hold on;

subplot(1, 3, 1);
stem(x, f);
title('Original signal');
    
subplot(1, 3, 2);
stem(S);
title('Power Spectrum');
    
subplot(1, 3, 3);
stem(phase);
title('Phase');

hold off;