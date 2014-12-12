%% hw2 prog3

close all;

%% Part (a)

k      = 15;
sigma  = 2;
H      = fspecial('log', [k, k], sigma);

figure;
plot(-H);

%% Part (b)

img = imread('/Users/masatoshi/Documents/cse166/DIP3E_Original_Images_CH10/Fig1022(a)(building_original).tif');
img = double(img);

tau              = 0;
F                = conv2(img, H, 'same');

idx              = F > 0;
thresholded      = zeros(size(F));
thresholded(idx) = F(idx);

figure;
imagesc(img);
colormap('Gray');
title('original image');

figure;
imagesc(F);
colormap('Gray');
title('filtered image');

figure;
imagesc(thresholded);
colormap('Gray');
title('filtered and thresholded image');

%% Part (c)

figure;
hold on;
imagesc(flipud(img));
colormap('Gray');
contour(flipud(F), [0, 0], 'r');
title('overlayed edge contour (Part c)');
hold off;

%% Part (d)

sigma           = 2;
tau             = 5;

N               = 4*sigma*sigma + 1;
binomial_kernel = PascalRow(N);
binomial_kernel = binomial_kernel' * binomial_kernel;
binomial_kernel = binomial_kernel ./ sum(binomial_kernel(:));
blurred_img     = conv2(img, binomial_kernel, 'same');

[dX, dY] = gradient(blurred_img);
M        = sqrt(dX.*dX + dY.*dY);
idx      = M > tau;
F2       = zeros(size(F));
F2(idx)  = F(idx);

figure;
hold on;
imagesc(flipud(img));
colormap('Gray');
contour(flipud(F2), [0, 0], 'r');
title('overlayed edge contour (Part d)');
hold off;
