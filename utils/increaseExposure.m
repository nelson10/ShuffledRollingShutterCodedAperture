function [J] = increaseExposure(Y,mask,N)
h=6;
c=0;
for i=1:N
    if(i >= h+1 && i <= N-(h+1))
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
        idx = N > i-h:i+h-1;
        g(:,:,c) = sum(mask(:,:,ind(idx)),3);
    end
end

sum(g(:))/numel(g)

for j=1:N
    J(:,:,j) = (g(:,:,j).*Y); 
end
end