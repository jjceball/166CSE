%% hw2 prog4 Part(a)
close all

x_0_range = [0, 1, 4];
n         = length(x_0_range);
 
figure;
hold on;

for i = 1:n
    % Create delta function signals
    x_0        = x_0_range(i);
    x          = 0:7;
    f          = zeros(length(x));
    f(x_0 + 1) = 1;
    
    % Perform DFT and plot
    F          = fft(f);
    Fc         = fftshift(F);
    S          = abs(Fc);
    phase      = angle(Fc);
    
    offset     = (i-1)*3;
    
    subplot(n, 3, 1 + offset);
    stem(x, f);
    title('Original signal');
    
    subplot(n, 3, 2 + offset);
    stem(S);
    title('Power Spectrum');
    
    subplot(n, 3, 3 + offset);
    stem(phase);
    title('Phase');
end

hold off;
