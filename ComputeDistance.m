% Created by: Ph.D Nelson Eduardo Díaz Díaz
% Post-doctorador Pontíficia Universidad Católica de Valparaíso (PUCV)
% Date: 17 May 2021

function [T] = ComputeDistance(G)

[~,L1]= size(G);
s = round(sqrt(L1));
G = G(1:s,1:s);
[L,L1]= size(G);
%R = round(L/2);
% Cube minimum distance
[r,c,z] = find(G);

B = [r c z];
T = zeros(L,L);
%dist(i,:) = sqrt(sum((B(i,:)-B).^2,2));
D = pdist(B);
dist = squareform(D);
m = L^2;
for i=1:m
%    for j=2:m-1
    %temp(i) = unique(dist(i,:));
    [~,~,values]=find(dist(i,:));
    %temp(cont)= D((i-1)*(m-i/2)+j-i);
    T(r(i),c(i)) = min(values); 
    %T(r(i),c(i)) = %temp(2);
end
end
%  N = 100;
%  roots([N^(2)-1 -3*N -3*N^2 -N^3])