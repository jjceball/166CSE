function [ D ] = GetDirection( X )
%GETDIRECTION Summary of this function goes here
%   Detailed explanation goes here

% d1 = horizontal edge
% d2 = vertica
% d3 = +45 degrees
% d4 = -45 degrees

D = zeros(size(X));

% horizontal edge (d1)
D((X >= -112.5) & (X < -67.5))  = 1;
D((X >= 67.5) & (X < 112.5))    = 1;

% vertical edge (d2)
D((X >= 157.5) | (X < -157.5))  = 2;
D((X >= -22.5) & (X < 22.5))    = 2;

% +45 degrees
D((X >= -157.5) & (X < -112.5)) = 3;
D((X >= 22.5) & (X < 67.5))     = 3;

% -45 degrees
D((X >= -67.5) & (X < -22.5))   = 4;
D((X >= 112.5) & (X < 157.5))   = 4;




end

