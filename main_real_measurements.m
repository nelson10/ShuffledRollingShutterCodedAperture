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
addpath(genpath('./real'))

%profile on
N = 256;  % spatial size
%% real measurements
load('wine.mat') 
Y = measO_roi;
mask = opt_mask;
figure(1)
imagesc(Y), title('Compressive Measurements using Designed Coded Apertures')
colormap('gray')

[J] = JointCodedApertures(Y,mask,N);

%% Reconstruction using designed coded apertures
[Xrec] = interpolation(J);
disp('Interpolation of Temporal Rolling Shutter Compressive Measurements Captured using Designed Coded Apertures')

implay(Xrec./max(Xrec(:))),title('Interpolation with Designed Coded Apertures')
Y = measR_roi;
mask = rnd_mask;

figure(2)
imagesc(Y), title('Compressive Measurements using Random Coded Apertures')
colormap('gray')

[J] = JointCodedApertures(Y,mask,N);
%% Reconstruction using random coded apertures
[Xrec] = interpolation(J);
disp('Interpolation of Temporal Rolling Shutter Compressive Measurements Captured using Random Coded Apertures')
implay(Xrec./max(Xrec(:))),title('Interpolation with Random Coded Apertures')
