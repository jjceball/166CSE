%% hw2 prog5

close all;

%% Part (a)

img = imread('/Users/jayceballos/Desktop/Fig0424(a)(rectangle).tif');
img2 = imread('/Users/jayceballos/Desktop/Fig0429(a)(blown_ic).tif');

F = fft2(img);
F2 = fft2(img2);

S = fftshift(log(1 + abs(F)));
S2 = fftshift(log(1 + abs(F2)));

figure;
colormap('gray');
imagesc(S, [5 13]);
figure;
colormap('gray');
imagesc(S2, [5 13]);

%% Part (b)

img3 = imread('/Users/jayceballos/Desktop/61.jpg');

figure;
colormap('gray');
imagesc(img3);

F3 = fft2(img3);

S3 = fftshift(log(1 + abs(F3)));

subplot();
figure;
colormap('gray');
imagesc(S3, [5 13]);
