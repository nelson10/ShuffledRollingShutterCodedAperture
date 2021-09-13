function [T] = distanceMax(G)

[L,L1]= size(G); 
% Cube minimum distance
[r,c,z] = find(G); 

B = [r c z];
dist = zeros(L*L,L*L);
T = zeros(L,L);
for i=1:L*L
    dist(i,:) = sqrt(sum((B(i,:)-B).^2,2));
    temp= max(dist(i,:));
    T(r(i),c(i)) =temp;
end
end