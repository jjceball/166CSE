%% Homework 5 Prog 2
close all

princangle = (1/2)*arctan((2*b)/(a-c));

otherangle = princangle + (pi/2); 

%% Part A

I = imread('/Users/jayceballos/Desktop/Fig1116(leg_bone).tif');

Igray= rgb2gray(I);
threshold= 128;
Ibw= Igray> threshold;

X = find(Ibw);

axis('image');
axis('ij');

P = plot(X.x,X.y,'b');

%% Part B

hold on;

centroid = mean(X);

P = plot(centroid.x,centroid.y,'rx');

%% Part C

C = plotmatrix(X.x, X.y);

[V,D] = eig(C);

%% Part D

deltamax = 0;
deltamin = 0;

(deltamax/deltamin)^(1/2);

%% Part E

x = X[i];
y = Y[i];
X[i] = x*math.cos(theta) - y*math.sin(theta);
Y[i] = x*math.sin(theta) + y*math.cos(theta);


