function [Xrec] = Demo_video_Real520(J)

L =size(J,3);
X = J;
fprintf('--------------TR_LRTV2-------------------\n');

temp = zeros(L,L,3,L);
for i=1:L
    for j=1:3
        temp(:,:,j,i) =X(:,:,i);
    end
end
for ii = 1:L
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
    %Z_TRLRTV2=LRTC_TV_II(index(:,1), value, lambda_1, lambda_2 ,alpha(1), beta(1), [256 256 1], 1 );
    %result(:,:,(3*(ii-1))+1:ii*3) = Z_TRLRTV2;
    result(:,:,ii)=Z_TRLRTV2(:,:,1);
    ii
end

L =size(result,3);
implay(result)
[perform_RSE,perform_PSNR] = performance_eval();

%%%%
for i=1:L
    frame = result(:,:,i);
    Xrec(:,:,i) = frame./max(frame(:));
end

% for i=1:L
%     p(i) = psnr(gt1(:,:,i),Xrec(:,:,i));
%     s(i) = ssim(Xrec(:,:,i),gt1(:,:,i));
%     v1= Xrec(:,:,i);
%     v2= gt1(:,:,i);
%     rm(i) = sqrt(mean(v1(:)-v2(:)).^2);
% end
% 
% psnr1 = mean(p);
% ssim1 = mean(s);
% rmse1 = mean(rm);
% disp("Unfold PSNR "+ num2str(psnr1)+ " SSIM "+num2str(ssim1)+" RMSE "+num2str(rmse1));
% 
% %% Generate images (Presentation)
% orig = gt1;
% mask = X;%dmd;
% recon = result;

end