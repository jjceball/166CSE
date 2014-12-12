function [ r ] = PascalRow( n )
%PASCALROW Summary of this function goes here
%   Detailed explanation goes here

r = 1;
for i = 2:n
    tmp = ones(1, i);
    for j = 2:i-1
        tmp(j) = r(j-1) + r(j);
    end
    r = tmp;
end

end

