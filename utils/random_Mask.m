function [mask] = random_Mask(N)
% Random
x = 1:N;
x = x(randperm(length(x)));
G(1,:) = x;
for i=2:N
    temp = x(2:end);
    G(i,1:end-1) = temp;
    G(i,end) = x(1);
    x = G(i,:);
end
G = G(x,:);

for i=1:N
    mask(:,:,i)=(G==i);
end
end