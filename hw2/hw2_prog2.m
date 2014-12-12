%% hw2 prog2
close all;

%% Part (c)

img = imread('/Users/masatoshi/Documents/cse166/DIP3E_Original_Images_CH10/Fig1005(a)(wirebond_mask).tif');
img = double(img);

sigma_sqrd_range  = [0.5, 1, 3];
n                 = length(sigma_sqrd_range);
tau               = 5.0;

for i = 1:n
    
    sigma_sqrd    = sigma_sqrd_range(i);
    sigma         = sqrt(sigma_sqrd);
    
    [E, M, A, D]  = canny(img, sigma, tau);
    
    figure;
    imagesc(E);
    colorbar;
    title_str     = sprintf('canny: sigma^2 = %f', sigma_sqrd);
    title(title_str);
    
end


%% Part(d)

img = imread('/Users/masatoshi/Documents/cse166/DIP3E_Original_Images_CH01/Fig0114(c)(bottles).tif');
img = double(img);

sigma        = 2;
tau          = 5;

[E, M, A, D] = canny(img, sigma, tau);

figure;
imagesc(E);
colorbar;
title_str    = sprintf('canny: sigma = %f, tau = %f', sigma, tau);
title(title_str);