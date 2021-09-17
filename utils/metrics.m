function [p,s,r] = metrics(data,Xrec)
N = size(Xrec,3);
for i=1:N
    frame = Xrec(:,:,i);
    Xrec(:,:,i) = frame./max(frame(:));
end

for i=1:N
    p(i) = psnr(Xrec(:,:,i),data(:,:,i));
    s(i) = ssim(Xrec(:,:,i),data(:,:,i));
    v1= Xrec(:,:,i);
    v2= data(:,:,i);
    rm(i) = sqrt(mean(v1(:)-v2(:)).^2);
end

p = mean(p); % psnr
s= mean(s); % ssim
r = mean(rm); % rmse
disp("PSNR "+ num2str(p)+ " SSIM "+num2str(s)+" RMSE "+num2str(r));
end
