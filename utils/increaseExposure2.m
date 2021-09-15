function [X] = increaseExposure2(Y,mask,N)

for j=1:N
    J(:,:,j) = ((mask(:,:,j).*Y))./255; 
end

nm = round(0.04*(N));
N1 = N/nm;
for jj=1:N1
    dmd(:,:,jj) = sum(mask(:,:,1+(jj-1)*(nm):(jj)*nm),3);
    X(:,:,jj) = sum(J(:,:,1+(jj-1)*(nm):(jj)*nm),3);
end
X = X./max(X(:));
end