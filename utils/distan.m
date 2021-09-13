% Created by: Ph.D Nelson Eduardo Díaz Díaz
% Post-doctorador Pontíficia Universidad Católica de Valparaíso (PUCV)
% Date: 17 May 2021

function [res]=distan(G,N)

%% 3D statistics
id = round(sqrt(N));
[r,c,z] = find(G(1:id,1:id)); %find(G(:,:)==4);
B = [r c z];
T = zeros(id,id);
D = pdist(B);
dist =squareform(D);
for i=1:id*id
    [~,~,values]=find(dist(i,:));
    T(r(i),c(i)) = min(values);
end
b = min(dist(dist>0));
res = b;
end


