T = ones(256,256,3)*255;
grid off;
imagesc(T)
set(gca,'visible','off')
%text = "white" + type + dataset + num2str(i);
text = "white";
saveas(gcf,text,'png')