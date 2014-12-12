%% HW3 Problem 1

%% Part A

close all;

u = -127:128;
v = -127:128;

[U, V] = meshgrid(u, v);

H = ones(size (U)) ./ (U.*U + V.*V);

H(128,128) = 0;

Y = randn(size (U));

colormap('gray');
imagesc(Y);

X = fft2(Y);

Z = X .* ifftshift(H);

S = ifft2(Z);

T = real(S);

figure;
colormap('gray');
imagesc(T);