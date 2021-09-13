% Created by: Ph.D Nelson Eduardo Díaz Díaz
% Post-doctorador Pontíficia Universidad Católica de Valparaíso (PUCV)
% Date: 17 May 2021

% Find Optimal values of a and b 

function [a,b]=DDDRSNNP(N)
M = round(N/2);
id = 1:M;
t = zeros(M,1);
for m = 1:M
    t(m) = iscoprime([m N]);
end
idx =id(t==1);
K = length(idx);
distance = zeros(N,N);
x = ones(1,N)';
y = (1:N)';

for i=1:K
    for j=i:K
        si = idx(i);
        sj = idx(j);
%         si = i;
%         sj = j;
        I = kron(x',y);
        J = kron(x,y');
        G = mod(I.*si + J.*sj,N)+1;
        [flag] = VerifyRollingShutter(G,N);
        if(flag == 1)
            [distance(si,sj)]=distan(G,N);
        end
    end
    %save("dist_best"+num2str(L),'distance')
    disp(i +" out of "+ num2str(K));
end
 %save("dist_best"+num2str(N),'distance')
 %load("dist_best"+num2str(N)+".mat")
 ma = max(distance(:));
 [b,a,~]= find(ma==distance);
 save("results/dist_best"+num2str(N),'distance','a','b')
end