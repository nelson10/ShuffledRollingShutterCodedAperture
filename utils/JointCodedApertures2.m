function [J,gt] = JointCodedApertures2(Y,mask,N,nnz,data)

for j=1:N
    J(:,:,j) = ((mask(:,:,j).*Y))./255; 
end

nm = round(nnz*(N))
N1 = N/nm;
for jj=1:N1
    dmd(:,:,jj) = sum(mask(:,:,1+(jj-1)*(nm):(jj)*nm),3);
    X(:,:,jj) = sum(J(:,:,1+(jj-1)*(nm):(jj)*nm),3);
    gt1(:,:,jj) = sum(data(:,:,1+(jj-1)*(nm):(jj)*nm),3);
    gt(:,:,jj) = gt1(:,:,jj)./max(gt1(:));
end
X = X./max(X(:));
sample =100*(sum(dmd(:))/numel(dmd));
disp("number of non-zero values " + num2str(sample) + "%");
end
