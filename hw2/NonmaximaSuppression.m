function [ E ] = NonmaximaSuppression( M, D )
%NONMAXIMASUPPRESSION Summary of this function goes here
%   Detailed explanation goes here

rows                    = size(M, 1);
cols                    = size(M, 2);
E                       = zeros(rows, cols);

%% Horizontal direction
% Below
N1                      = zeros(rows, cols);
pM1                     = zeros(rows, cols);
pM1(1:rows-1, :)        = M(2:rows, :);
N1(D == 1)              = pM1(D == 1);
% Above
N2                      = zeros(rows, cols);
pM2                     = zeros(rows, cols);
pM2(2:rows, :)          = M(1:rows-1, :);
N2(D == 1)              = pM2(D == 1);

idx                     = D == 1 & M >= N1 & M >= N2;
E(idx)                  = M(idx);

%% Vertical direction 
% Left
N1                      = zeros(rows, cols);
pM1                     = zeros(rows, cols);
pM1(:, 2:cols)          = M(:, 1:cols-1);
N1(D == 2)              = pM1(D == 2);
% Right
N2                      = zeros(rows, cols);
pM2                     = zeros(rows, cols);
pM2(:, 1:cols-1)        = M(:, 2:cols);
N2(D == 2)              = pM2(D == 2);

idx                     = D == 2 & M >= N1 & M >= N2;
E(idx)                  = M(idx);

%% +45 degrees direction
% Lower right
N1                      = zeros(rows, cols);
pM1                     = zeros(rows, cols);
pM1(1:rows-1, 1:cols-1) = M(2:rows, 2:cols);
N1(D == 3)              = pM1(D == 3);
% Upper left
N2                      = zeros(rows, cols);
pM2                     = zeros(rows, cols);
pM2(2:rows, 2:cols)     = M(1:rows-1, 1:cols-1);
N2(D == 3)              = pM2(D == 3);

idx                     = D == 3 & M >= N1 & M >= N2;
E(idx)                  = M(idx);

%% -45 degrees direction
% Lower left
N1                      = zeros(rows, cols);
pM1                     = zeros(rows, cols);
pM1(1:rows-1, 2:cols)   = M(2:rows, 1:cols-1);
N1(D == 4)              = pM1(D == 4);
% Upper right
N2                      = zeros(rows, cols);
pM2                     = zeros(rows, cols);
pM2(2:rows, 1:cols-1)   = M(1:rows-1, 2:cols);
N2(D == 4)              = pM2(D == 4);

idx                     = D == 4 & M >= N1 & M >= N2;
E(idx)                  = M(idx);


end

