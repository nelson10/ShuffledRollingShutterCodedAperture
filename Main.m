% Created by: Ph.D Nelson Eduardo Díaz Díaz
% Post-doctorador Pontíficia Universidad Católica de Valparaíso (PUCV)
% Date: 17 May 2021

% Solution using The 3-D N2-Queens problem
clear;
close all
clc
addpath(genpath('./utils'));
%profile on
N = 256;  % spatial size
[a,b]=DDDRSNNP(N);
%profile viewer
%load("dist_best"+num2str(N)+".mat");

G = zeros(N,N);
mask = zeros(N,N,N);
A = zeros(N,N);
psnr = zeros(N,N);
temp0 =[];
temp1 =[];
a1 = a(1);
b1 = b(1);
x = 0;
for i = 1:N
    for j=1:N
        G(j,i) = mod(x+(i*a1) + (j*b1),N) +1;
        mask(j,i,G(j,i))=1;
    end
end
%imagesc(mask(:,:,1))
text = " a= "+num2str(a1) + " b= "+num2str(b1);
disp(text);
[flag] = VerifyRollingShutter(G,N);
flag
figure(2)
subplot(2,2,3),imagesc(G),title('Designed coded aperture', 'FontSize', 12), colorbar;
colormap('jet')

[T] = ComputeDistance(G);

m = max(T(:));
minimum = min(T(:));
text = "design-mask_optimize_"+num2str(N)+"x"+num2str(N);
save(text,'mask','G','minimum');
stand = std(T(:));
prom = mean(T(:));
texto = "Minimum = " + num2str(minimum) + ", Maximun = " + num2str(m) + ", Standart Desv = " + num2str(stand) + ", Mean = " + num2str(prom);
subplot(2,2,4),imagesc(T),title(texto, 'FontSize', 12), colorbar;

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

subplot(2,2,1),imagesc(G),title('Random coded aperture', 'FontSize', 12), colorbar;
colormap('jet')
[T] = ComputeDistance(G);
m = max(T(:));
minimum = min(T(:));
text = "design-mask_random_"+num2str(N)+"x"+num2str(N);
save(text,'mask','G','minimum');
stand = std(T(:));
prom = mean(T(:));
texto = "Minimum = " + num2str(minimum) + ", Maximun = " + num2str(m) + ", Standart Desv = " + num2str(stand) + ", Mean = " + num2str(prom);
subplot(2,2,2),imagesc(T),title(texto, 'FontSize', 12), colorbar;
saveas(gcf,'figure3','epsc')