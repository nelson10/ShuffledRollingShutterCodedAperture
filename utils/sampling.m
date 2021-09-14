function [Y] = sampling(data,mask,N)
Y = zeros(N,N); % measurements

for i=1:N
    Y = Y+ (data(:,:,i).*mask(:,:,i));
end

Y = mat2gray(Y);
end