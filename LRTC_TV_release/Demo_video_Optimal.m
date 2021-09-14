clear all;
clc
close all;
filename=cell(1,1);
filename{1}='airplane';
fprintf('--------------TR_LRTV2-------------------\n');

ff = 1;
myName=sprintf('TestImages/%s.bmp',filename{ff});
A=imread(myName);
A=double(A)/255.0;
figure(1);  imshow(A);

N=3;
lambda=0.02;
alpha=[1/N, 1/N, 1/N];
lambda_1=0.5;
lambda_2=1000;
beta=[1,1,0];
[row, col, channel]=size(A);
tsize=[row, col, channel];
 %rate=1 - 0.99;
 load('design-mask_optimize_256x256wine2.mat')
 LL = 256;
 rate = 0.039;
 L1 = round(LL * rate);
 T1 = sum(gdmd(:,:,1:L1),3);
counter=1;
for i=1:row
    for j=1:col
        for k=1:channel
            if(T1(i,j,1))
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
imagesc(Z_TRLRTV2)
[perform_RSE,perform_PSNR] = performance_eval();