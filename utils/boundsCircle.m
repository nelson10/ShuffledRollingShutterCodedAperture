n = 4:10000;
%n = (3:11).^4;
%n1 = (3:11).^2;
lb = sqrt((2./(sqrt(3).*n)))-0.005;
ub1 = (1./(n-1));
ub2 = (ub1.^2);
ub3 = (2./(sqrt(3).*(n-1)));
ub = ub1 + sqrt(ub2 + ub3);
%d = [1 0.771 0.6009 0.5359 0.5176 0.5 0.4213 0.3982 0.3887 0.3661 0.3489 0.3411 0.3333 0.3062 0.3005 0.2895 0.2866 ...
%     0.2718 0.2680 0.2588 0.2543 0.25 0.2387 0.2358 0.2305 0.2269 0.2245 0.2175 0.2132 0.2113 0.2056 0.2028 0.2 0.1964 ...
 %    0.1953 0.1944 0.1882]; 
%k = (n + 2).^(1/2);
%d = (1./(k-2+(0.5.*(3).^(1/3))));
d = 1./(sqrt(n)-1);
sum(ub > d)
 %lb = lb.*n1;
 %ub = ub.*n1;
%d = [0.117097826866 0.08403 0.061949671934].*2;
%d = [0.305816563817299083193946649361 0.202030508910442149828812674887 0.141421357238561534317118098832];
%d = [2.23 2.44 3.0 3.31 3.74 4.24 4.58 5 5.38];


%d = (d-1.5)./(0.04.*n1);

loglog(n,lb,'LineWidth',2)
hold on 
loglog(n,ub,'LineWidth',2)
hold on 
loglog(n,d,'LineWidth',2)
title('Circle Theoretical Optimal distance Lower, and Upper Bounds', 'FontSize', 12)
legend('Lower bound','Upper bound','Optimal', 'FontSize', 12)
xlabel('Number of points', 'FontSize', 12)
ylabel('Distance ', 'FontSize', 12)
grid on
saveas(gcf,'boundsCircle','epsc')