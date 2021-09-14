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

%profile on
N = 256;  % spatial size


load('wine.mat') % real measurements
Y = measO_roi;
mask = opt_mask;
%Y = sampling(data,mask,N); % compute compressive measurements with designed mask
figure(1)
imagesc(Y), title('Compressive Measurements using Designed Coded Apertures')
colormap('gray')

[J] = increaseExposure(Y,mask,N);

% Reconstruction using designed coded apertures
[Xrec] = interpolation(J);
disp('Interpolation of Temporal Rolling Shutter Compressive Measurements Captured using Designed Coded Apertures')
%[p,s,r] = metrics(data,Xrec);

implay(Xrec./max(Xrec(:))),title('Interpolation with Designed Coded Apertures')

Y = measR_roi;
mask = rnd_mask;

figure(2)
imagesc(Y), title('Compressive Measurements using Random Coded Apertures')
colormap('gray')

[J] = increaseExposure(Y,mask,N);
% Reconstruction using random coded apertures
[Xrec] = interpolation(J);
disp('Interpolation of Temporal Rolling Shutter Compressive Measurements Captured using Random Coded Apertures')
%[p,s,r] = metrics(data,Xrec);
implay(Xrec./max(Xrec(:))),title('Interpolation with Random Coded Apertures')