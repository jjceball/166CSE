function [ E, M, A, D] = canny(I, sig, tau)
%CANNY Summary of this function goes here
%   Detailed explanation goes here

% Step (1) Blur image
N               = 4*sig*sig + 1;
binomial_kernel = PascalRow(N);
binomial_kernel = binomial_kernel' * binomial_kernel;
binomial_kernel = binomial_kernel ./ sum(binomial_kernel(:));
blurred_I       = conv2(I, binomial_kernel, 'same');

% Step (2) Compute gradient
[dX, dY]        = gradient(blurred_I);
M               = sqrt(dX.*dX + dY.*dY);
A               = atan2(dY, dX);
A               = (180/pi)*A;

% Step (3) Perform nonmaxima supression
D               = GetDirection(A);
E               = NonmaximaSuppression(M, D);
E(E < tau)      = 0;

end

