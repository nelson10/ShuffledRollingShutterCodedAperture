close all
clear;
n = (2:11);
x = n;
x = [x 16 25].^2;
x = [x 1372 2048 4000 6912 10976 14896 21438 29660 39754 51912 66326 83188 108000];


n =[n 16 25 36 49 64 81 100 121 144 169 196 225 256 289 324 361];
n1 = n;
n = (n).^2;
nt = 24;
%x= logspace(0,100000,1000);

contlb = n1+1;%sqrt(3);
contub = n1+1;%sqrt(35);
lb = (sqrt(2./(sqrt(3).*n)).*contlb);% - 0.1;
ub1 = (1./(n-1));
ub2 = (ub1.^2);
ub3 = (2./(sqrt(3).*(n-1)));
ub = ub1 + sqrt(ub2 + ub3);
ub = ub .*contub;

%d = [2.23 2.44 3.0 3.31 3.74 4.24 4.58 5 5.38 5.47]./((n1));
k = (n + 2).^(1/3);
%d2 = (1./(k-2+(0.5.^(1/3))));
%d2 = (1./(((n).^(1/3)-1)))+0.002;
d = [1.4142 1.4142 1.4142 1.4142 1.4142 1.7321 1.4142 2.2361 1.4142 2.2361 2.4495 3 2.8284 3.7417 3.7417 4.2426 4.6904 5.3852 5.4772 5.8310 6.1644 6.4031 6.4807 7.0711 7.3485 7.6811]./(n1+1);
den = pi/sqrt(18);
rt = 2  .* ( ((sqrt(n) + 1).^(3)) ./ ((4*n.*sqrt(2))) ).^(1/3);
rt = rt ./(n1+1);
%rt = (((3*den*sqrt(2))./(n.*pi)).^(1/3))*2;
%rt = [0.2928 0.2320 0.1887 0.1678  0.1493 0.1364 0.1267 0.1170 0.1113 0.1047 0.084 0.0619 0.0490 0.0443 0.0346 0.0289 0.0248 0.0225 0.0199 0.0179 0.0162 0.0149 0.0137 0.0127 0.0117].*2;


loglog(n(1:nt),d(1:nt),'LineWidth',2)
hold on 
loglog(n(1:nt),rt(1:nt),'LineWidth',2)
%loglog(n(1:nt),d2(1:nt),'LineWidth',2)


%loglog(n(1:nt),lb(1:nt),'LineWidth',2)
%loglog(n(1:nt),ub(1:nt),'LineWidth',2)

title('Sphere Theoretical Optimal Distance Lower, and Upper Bounds', 'FontSize', 12)
legend('Optimized Rolling-shutter','Upper bound (theoretical)','Lower bound','Upper bound','LineWidth',2)
xlabel('Number of points', 'FontSize', 12)
ylabel('Distance ', 'FontSize', 12)
grid on;
%legend('Lower bound','Upper bound','optimal','LineWidth',2)
%d2 > d
saveas(gcf,'boundsSphere','epsc')