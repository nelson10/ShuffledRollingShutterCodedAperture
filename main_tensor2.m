% Created by: Ph.D Nelson Eduardo Díaz Díaz
% Post-doctorador Pontíficia Universidad Católica de Valparaíso (PUCV)
% Date: 17 May 2021

% Solution using The 3-D N2-Queens problem
clear;
close all
clc
addpath(genpath('./utils'));
addpath(genpath('./results'));
addpath(genpath('./CodedApertureDesignOptimal'));
addpath(genpath('./dataset'))
addpath(genpath('./Reconstruction'))
addpath(genpath('./LRTC_TV_release'))


%profile on
N = 256;  % spatial size
[a,b]=DDDRSNNP(N);

G = zeros(N,N);
mask = zeros(N,N,N);
temp0 =[];
temp1 =[];
a1 = a(1);
b1 = b(1);
tensor = 1; % 0 for interpolation, 1 for tensor completion.
x = 0;
for i = 1:N
    for j=1:N
        G(j,i) = mod(x+(i*a1) + (j*b1),N) +1;
        mask(j,i,G(j,i))=1;
    end
end

[T] = distan(G);
m = max(T(:));
minimum = min(T(:));


for k=1:1
    alldataset = {'wine2','wave','splash'};
    dataset = alldataset{k};
    load(dataset+".mat")
end

% for i=1:N
%    data1(:,:,i) = imresize(data(:,:,i),0.125);
% end
Y = sampling(data,mask,N); % compute compressive measurements with designed mask

figure(1)
imagesc(Y), title('Compressive Measurements using Designed Coded Apertures')
colormap('gray')
nnz = 0.03; % number of non-zero elements in the Tensor

[J,gt] = JointCodedApertures2(Y,mask,N,nnz,data);

%% Reconstruction using designed coded apertures
if(tensor==0)
    [Xrec] = interpolation(J);
else
    [Xrec] = Demo_RSvideo_Tensor(J);
end
disp('Tensor Completion of Temporal Rolling Shutter Compressive Measurements Captured using Designed Coded Apertures')
[p,s,r] = metrics(gt,Xrec);

implay(Xrec),title('Tensor Completion with Designed Coded Apertures')

[mask] = random_Mask(N);
Y = sampling(data,mask,N); % compute compressive measurements with random mask

figure(2)
imagesc(Y), title('Compressive Measurements using Random Coded Apertures')
colormap('gray')

[J,gt] = JointCodedApertures2(Y,mask,N,nnz,data);
%% Reconstruction using designed coded apertures
if(tensor==0)
    [Xrec] = interpolation(J);
else
    [Xrec] = Demo_RSvideo_Tensor(J);
end
disp('Completion  of Temporal Rolling Shutter Compressive Measurements Captured using Random Coded Apertures')
[p,s,r] = metrics(gt,Xrec);
implay(Xrec),title('Tensor Completion with Random Coded Apertures')
