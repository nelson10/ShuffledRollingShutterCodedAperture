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
[a,b]=DDDRSNNP(N);

G = zeros(N,N);
mask = zeros(N,N,N);
psnr = zeros(N,N);
Y2 = zeros(N,N); % 
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


for k=4:4
    alldataset = {'traffic','step1','horse2','dogo2'};
    dataset = alldataset{k};
    load(dataset+".mat")
end

for i=1:N
    Y2 = Y2+ (data(:,:,i).*mask(:,:,i));
end
imagesc(Y2), title('Compressive Measurements ')
colormap('gray')
Y2 = mat2gray(Y2);
disp('Results')

h=6;
c=0;
L = N;
for i=1:L
    if(i >= h+1 && i <= L-(h+1))
        c =c + 1;
        g(:,:,c) = sum(mask(:,:,i-h:i+h-1),3);
    elseif(i < h+1)
        c = c + 1;
        ind = i-h:i+h-1;
        idx = 0 < i-h:i+h-1;
        g(:,:,c) = sum(mask(:,:,ind(idx)),3);
    else
        c = c + 1;
        ind = i-h:i+h-1;
        idx = L > i-h:i+h-1;
        g(:,:,c) = sum(mask(:,:,ind(idx)),3);
    end
end

sum(g(:))/numel(g)
for j=1:L
    J(:,:,j) = (g(:,:,j).*Y2); 
    %imagesc(J(:,:,j))
    %pause(0.025)
end

[Xrec] = interpolation(J);
implay(Xrec)
