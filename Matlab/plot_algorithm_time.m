% Algorithm excecution time Bar plot for diferent signals.

% x = ["KNN" "NB" "SVM" "MLP"];
% y = [100 100 ; 99.9 100 ;100 100 ; 100 100];
% bar(x,y)
% lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
% set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
% ax = gca;
% ax.FontName = 'Times New Roman';
% ylim([0 100]);
% % ylabel('Acc %');
% ylabel('Acc %','FontSize',8,'FontName','Arial');
% % title('Sinc DataSet at 25dB SNR');
% grid on;

x = ["Sinc" "Gauss" "Chirp" ];
y = [9.1 27.3 6.4 4.5 17.6 18.2; 9.1 24.1 6.9 4.5 17.7 35.5; 9.8 27.9 6.4 4.6 48.9 18.4];
barh(x,y)
xlabel('Time [mS]')
xlim([0 60])  % Set X-axis range
lgd = legend({"KNN" ,"NB" ,"SVM" ,"MLP","1D-CNN 256pt.","1D-CNN 1024pt."}, 'Location','southeast');
set(lgd, 'FontSize', 8, 'FontName', 'Times New Roman');
ax = gca;
ax.FontName = 'Times New Roman';
grid on;


