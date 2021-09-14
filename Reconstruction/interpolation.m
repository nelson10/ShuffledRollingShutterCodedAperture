function [Xrec] = interpolation(J)
[M,N,L]= size(J);
Xrec = zeros(M,N,L);
for j=1:L
    X = J(:,:,j);
    [x,y,v] = find(X);
    [xq,yq] = find(X==0);
    %x1 = interp2(x,y,v,xq,yq);
    F = scatteredInterpolant(x,y,v,'natural');
    vq = F(xq,yq);
    for i=1:length(vq)
        X(xq(i),yq(i)) = vq(i);
    end
    Xrec(:,:,j) = X;
end
%implay(Xrec)
end