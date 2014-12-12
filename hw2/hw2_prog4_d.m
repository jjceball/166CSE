%% hw2 prog4 Part(a)
close all

sigma_sqrd_range = [1, 2, 3];
n                = length(sigma_sqrd_range);

figure;
hold on;

for i = 1:n
    % Create binomial kernel
    sigma_sqrd      = sigma_sqrd_range(i);
    N               = 4*sigma_sqrd + 1;
    binomial_kernel = PascalRow(N);
    len             = length(binomial_kernel);
    f               = zeros(1, 64);
    f(1:len)        = binomial_kernel;
    x               = 0:63;
    
    
    % Perform DFT and plot
    F               = fft(f);
    Fc              = fftshift(F);
    S               = abs(Fc);
    phase           = angle(Fc);
    
    offset          = (i-1)*3;
    
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