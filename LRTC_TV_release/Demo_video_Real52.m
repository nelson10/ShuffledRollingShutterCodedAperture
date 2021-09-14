clear all;
clc
close all;
filename=cell(1,1);
addpath(genpath('C:\Users\NELSO\OneDrive\Documentos\DL-CACTI-master\Rolling_Shutter_simulator\Rolling\Measurements'));

addpath ./GT
addpath ./Videos
addpath ./Codes
textpathcodes = "./Codes/";
textpathvideos = "./Videos/";
textpathgt = "./GT/";
%type = "optimize";
%type = "random";
for ll=1:1
alldataset= {'traffic','step1','horse2','dogo2','runner2','fresa','fan2','mix1','stick','splash','wine1','car','coffe2','mayo','balloon','milk','cereal1','orange','dancer','satelite'};%'dogo2';  %dataset name ('milk', 'car', 'balloon', 'stick', 'satelite','cereal1','bubble2','fresa','orange','step1','traffic')
dataset = alldataset{ll};

%test = 'design-mask_'+type+'_256x256'+dataset;
load('meas_calib1.mat')
L = 520;
gdmd =mask;
Y2 = meas;
for j=1:L
    J(:,:,j) = ((gdmd(:,:,j).*Y2))./255; 
end
[M,N2,L]= size(J);
nm = round(0.04*(L));
N1 = L/nm;
for jj=1:N1
    dmd(:,:,jj) = sum(gdmd(:,:,1+(jj-1)*(nm):(jj)*nm),3);
    X(:,:,jj) = sum(J(:,:,1+(jj-1)*(nm):(jj)*nm),3);
end

fprintf('--------------TR_LRTV2-------------------\n');

temp = zeros(L,L,3,L);
for i=1:N1
    for j=1:3
        temp(:,:,j,i) =X(:,:,i);
    end
end
for ii = 1:N1
    %A = X(:,:,(3*(ii-1))+1:ii*3);
    A = temp(:,:,:,ii);
    %figure(1);  implay(A)%imshow(A);
    
    N=3;
    lambda=0.02;
    alpha=[1/N, 1/N, 1/N];
    lambda_1=0.5;
    lambda_2=1000;
    beta=[1,1,0];
    [row, col, channel]=size(A);
    tsize=[row, col, channel];
    %rate=1 - 0.63;
    
    counter=1;
    for i=1:row
        for j=1:col
            for k=1:channel
                %if(rand()<rate)
                if(A(i,j,k)~=0)
                    index(counter,1)=i;
                    index(counter,2)=j;
                    index(counter,3)=k;
                    value(counter)=A(i,j,k);
                    B(i,j,k)=A(i,j,k);
                    mark(i,j,k)=false;
                    counter=counter+1;
                end
            end
        end
    end
    
    Z_TRLRTV2=LRTC_TV_II(index, value, lambda_1, lambda_2 ,alpha, beta, tsize, N );
    result(:,:,(3*(ii-1))+1:ii*3) = Z_TRLRTV2;
end
%imagesc(Z_TRLRTV2)
L =size(result,3);
implay(result)
[perform_RSE,perform_PSNR] = performance_eval();

%%%%
for i=1:L
    frame = result(:,:,i);
    Xrec(:,:,i) = frame./max(frame(:));
end

for i=1:L
    p(i) = psnr(gt1(:,:,i),Xrec(:,:,i));
    s(i) = ssim(Xrec(:,:,i),gt1(:,:,i));
    v1= Xrec(:,:,i);
    v2= gt1(:,:,i);
    rm(i) = sqrt(mean(v1(:)-v2(:)).^2);
end

psnr1 = mean(p);
ssim1 = mean(s);
rmse1 = mean(rm);
disp("Unfold PSNR "+ num2str(psnr1)+ " SSIM "+num2str(ssim1)+" RMSE "+num2str(rmse1));

%% Generate images (Presentation)
orig = gt1;
mask = X;%dmd;
recon = result;
end

% for i=1:L
%     imagesc(recon(:,:,i))
%     colormap('gray')
%     set(gca,'visible','off')
%     text = "video" + type + dataset + num2str(i);
%     saveas(gcf,textpathvideos+text,'png')
%     
%     imagesc(mask(:,:,i))
%     colormap('gray')
%     set(gca,'visible','off')
%     text = type+num2str(nm)+"_code"+num2str(i);
%     saveas(gcf,textpathcodes+text,'png')
%     
%     imagesc(orig(:,:,i))
%     colormap('gray')
%     set(gca,'visible','off')
%     text = dataset+"_gt"+num2str(i);
%     saveas(gcf,textpathgt+text,'png')
% end