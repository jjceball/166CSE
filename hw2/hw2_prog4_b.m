%% hw2 prog4 Part(a)
close all

omega_0_range = [0, pi/4, pi/2, pi];
n             = length(omega_0_range);

figure;
hold on;

for i = 1:n
    % Create cosine signals
    omega_0  = omega_0_range(i);
    x        = 0:7;
    f        = cos(omega_0*x);
    
    % Perform DFT and plot
    F        = fft(f);
    Fc       = fftshift(F);
    S        = abs(Fc);
    phase    = angle(Fc);
    
    offset   = (i-1)*3;
    
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