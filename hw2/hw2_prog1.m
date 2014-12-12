%% hw2 prog1

close all;

% Iterate over a range of standard deviations
sigma_sqrd_range = [1, 2.5, 4, 5.5];
n                = length(sigma_sqrd_range);
sigma_range      = sqrt(sigma_sqrd_range);

figure;
    
for i = 1:n
    
    sigma_sqrd    = sigma_sqrd_range(i);
    sigma         = sigma_range(i);
    
    % Create binomial kernel
    N             = 4 * sigma_sqrd + 1;
    binom_kernel  = PascalRow(N);
    binom_kernel  = binom_kernel ./ sum(binom_kernel);
    
    % Create Gaussian function
    gcoef         = 1/sqrt(2*pi*sigma_sqrd);
    expcoef       = 1/(2*sigma_sqrd);
    gaussian_func = sprintf('%f*exp((-x^2)*%f)', gcoef, expcoef);
    lims          = [-3, 3]*sigma;
    step          = 6 / (length(binom_kernel) - 1);
    X             = (-3:step:3)*sigma;
    
    % Display plot
    subplot(n, 1, i);
    hold on;
    fplot(gaussian_func, lims);
    stem(X, binom_kernel);
    hold off;
end