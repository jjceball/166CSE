function [ Y ] = FindZeroCrossings( X )
%FINDZEROCROSSINGS Summary of this function goes here
%   Detailed explanation goes here

rows = size(X, 1);
cols = size(X, 2);

%zero pad the input for convenience
pX   = zeros(rows+2, cols+2);
pY   = zeros(rows+2, cols+2);
pX(2:rows+1, 2:cols+1) = X;

for c = 2:cols+1
    
    for r = 2:rows+1
        
        % Left-Right
        d1 = pX(r, c-1) * pX(r, c+1);
        
        % Up-Down
        d2 = pX(r-1, c) * pX(r+1, c);
        
        % +45 degrees
        d3 = pX(r-1, c-1) * pX(r+1, c+1);
        
        % -45 degrees
        d4 = pX(r-1, c+1) * pX(r+1, c-1);
        
        pY(r, c) = d1 < 0 | d2 < 0 | d3 < 0 | d4 < 0;
        
    end
end

Y    = pY(2:rows+1, 2: cols+1);

end

