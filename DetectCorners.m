function [  ] = DetectCorners( image, k )
%DETECTCORNERS Summary of this function goes here
%   Detailed explanation goes here
figure;
subplot(1,2,1);
imshow(image);
hold on; 

image = double(image);

[Gx, Gy] = gradient(image);

kernel = ones(3);

Exsquare = conv2(Gx.^2, kernel, 'same');
Eysquare = conv2(Gy.^2, kernel, 'same');
ExEy = conv2(Gx.*Gy, kernel, 'same');

corners = zeros(size(image));
phi = zeros(size(image));

for r = 1: size(image, 1)
    for c = 1: size(image, 2)
        C = [Exsquare(r, c) ExEy(r, c); ExEy(r, c) Eysquare(r, c)];
        I = sort(eig(C), 'ascend'); 
        corners(r, c) = I(1);
        phi(r, c) = (1/2)*atan2((2*C(1,2)),(C(1,1)-C(2,2)));
    end
end

tao = k * max(corners(:));

corners = corners > tao; 

[Y, X] = find(corners);
plot(X, Y, 'r.');
axis('ij');
hold off;
subplot(1,2,2);
imshow(phi,[]);
%colorbar;
end

