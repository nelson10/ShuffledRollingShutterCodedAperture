close all
clear;
n1 = 2:100000;
n = (n1).^3;

contlb = n1+1;%(n-1).^(1/8);%sqrt(3);
contub = n1+1;%(n-1).^(0.25);
lb = sqrt(2./(sqrt(3).*n)).*contlb;
lb = lb - 0.0025;
ub1 = (1./(n-1));
ub2 = (ub1.^2);
ub3 = (2./(sqrt(3).*(n-1)));
ub = ub1 + sqrt(ub2 + ub3);
ub = ub .*contub;

d1 = (1./(((n).^(1/3)-1)));
k = (n +1).^(1/3);
d2 = (1./(k -3 +(sqrt(2 +sqrt(3)))));
k = (n + 2).^(1/3);
d3 = (1./(k-2+(0.5 .* (3.^(1/2)))));
%k = sqrt(n-floor(k+2));
%d4 = sqrt( (1/(k.^2)) + (1/(2*k-2).^2) );

loglog(n,ub,'LineWidth',2)
hold on 
loglog(n,d1,'LineWidth',2)
%loglog(n,lb,'LineWidth',2)

%plot(n,d2,'LineWidth',2)
%plot(n,d3,'LineWidth',2)
title('Sphere Theoretical Optimal Distance Lower, and Upper Bounds', 'FontSize', 12)
legend('Upper bound','Optimal','Lower bound','LineWidth',2, 'FontSize', 12)
xlabel('Number of points', 'FontSize', 12)
ylabel('Distance ', 'FontSize', 12)
grid on;
%saveas(gcf,'boundsSphereTheoric','epsc')