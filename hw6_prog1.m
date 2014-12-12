%% HW6 Programming Exercise 1
close all

%% Part A

img = imread('/Users/jayceballos/Desktop/Prob10.18(right).jpg');
img1 = imread('/Users/jayceballos/Desktop/Fig10.29(a).jpg');

detectCorners(img, 0.8); 

%% Part B

detectCorners(img1, 0.2); 