% Algorithm excecution time Bar plot for diferent signals.

% Scientific Plot Friendly Palette
% 
% Color	RGB
% Deep Blue	[0 0.45 0.74]
% Orange	[0.85 0.33 0.10]
% Green	    [0.47 0.67 0.19]
% Red	    [0.64 0.08 0.18]
% Purple	[0.49 0.18 0.56]
% Brown	    [0.55 0.34 0.29]

% MATLAB Blue	[0 0.447 0.741]
% MATLAB Orange	[0.850 0.325 0.098]
% MATLAB Yellow	[0.929 0.694 0.125]
% MATLAB Purple	[0.494 0.184 0.556]
% MATLAB Green	[0.466 0.674 0.188]
% MATLAB Cyan	[0.301 0.745 0.933]
% MATLAB Dark Red	[0.635 0.078 0.184]

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

% x = ["Sinc" "Gauss" "Chirp" ];
% y = [9.1 27.3 6.4 4.5 17.6 18.2; 9.1 24.1 6.9 4.5 17.7 35.5; 9.8 27.9 6.4 4.6 48.9 18.4];
% barh(x,y)
% xlabel('Time [mS]')
% xlim([0 60])  % Set X-axis range
% lgd = legend({"KNN" ,"NB" ,"SVM" ,"MLP","1D-CNN 256pt.","1D-CNN 1024pt."}, 'Location','southeast');
% set(lgd, 'FontSize', 8, 'FontName', 'Times New Roman');
% grid on;

% % Only Machine Learning 
% x = ["MLP" "SVM" "BN" "KNN"  ];
% y = [2.2 1.4; 2 2.6 ; 2.1 23.5; 2.1 5.7];
% barh(x,y,'stacked')
% xlabel('Time [mS]')
% xlim([0 60])  % Set X-axis range
% % lgd = legend({"KNN" ,"NB" ,"SVM" ,"MLP","1D-CNN 256pt.","1D-CNN 1024pt."}, 'Location','southeast');
% % set(lgd, 'FontSize', 8, 'FontName', 'Times New Roman');
% ax = gca;
% ax.FontName = 'Times New Roman';
% grid on;

clc;
clear;
close all;

%% DATA
% Each row = one bar
% Columns = stacked components

data = [
% Sinc
    2.1 5.7;    % Group 2 - KNN
    2.1 23.5;   % Group 2 - NB
    2   2.6;    % Group 1 - SVM
    2.2 1.4;    % Group 1 - MLP

    11.7 0  ;   % sinc 256
    12.6 0  ;   % sinc 1024
% Gauss
    2.2 6.1;   % Group 2 - KNN
    2.2 21.5;  % Group 2 - NB
    2.2 3.8;   % Group 1 - SVM
    2.4 2.3;   % Group 1 - MLP

    14  0;     % gauss 256
    20.6 0;    % gauss 1024
% Chirp
    2.2 6.7;   % Group 2 - KNN
    2.2 25.2;  % Group 2 - NB
    2.1 3.7;   % Group 1 - SVM
    2.3 2.3;   % Group 1 - MLP

    15.4 0;    % chirp 256
    12.5 0;    % chirp 1024
];
%% X positions
% Create spacing between groups

x = [1 2 3 4 5 6  8 9 10 11 12 13  15 16 17 18 19 20];

%% PLOT
figure;

b = barh(x, data, 'stacked');

%% ENABLE INDIVIDUAL BAR COLORS
b(1).FaceColor = 'flat';
b(2).FaceColor = 'flat';

%% PAINT SPECIFIC BARS

% 
b(2).CData(1,:) = [0 0.45 0.74]; % 
b(1).CData(1,:) = [1 1 0]; % essc

b(2).CData(2,:) = [0.85 0.33 0.10]; % 
b(1).CData(2,:) = [1 1 0]; % essc

b(2).CData(3,:) = [0.929 0.694 0.125]; % 
b(1).CData(3,:) = [1 1 0]; % essc

b(2).CData(4,:) = [0.49 0.18 0.56]; % 
b(1).CData(4,:) = [1 1 0]; % essc

% overwrite essc colour to define CNN
b(1).CData(5,:) = [0.47 0.67 0.19]; % 
b(1).CData(6,:) = [0.301 0.745 0.933]; % 

% 
b(2).CData(7,:) = [0 0.45 0.74]; % 
b(1).CData(7,:) = [1 1 0]; % essc

b(2).CData(8,:) = [0.85 0.33 0.10]; % 
b(1).CData(8,:) = [1 1 0]; % essc

b(2).CData(9,:) = [0.929 0.694 0.125]; % 
b(1).CData(9,:) = [1 1 0]; % essc

b(2).CData(10,:) = [0.49 0.18 0.56]; % 
b(1).CData(10,:) = [1 1 0]; % essc

b(1).CData(11,:) = [0.47 0.67 0.19]; 
b(1).CData(12,:) = [0.301 0.745 0.933];

% 
b(2).CData(13,:) = [0 0.45 0.74]; % 
b(1).CData(13,:) = [1 1 0]; % essc

b(2).CData(14,:) = [0.85 0.33 0.10]; % 
b(1).CData(14,:) = [1 1 0]; % essc

b(2).CData(15,:) = [0.929 0.694 0.125]; % 
b(1).CData(15,:) = [1 1 0]; % essc

b(2).CData(16,:) = [0.49 0.18 0.56]; % 
b(1).CData(16,:) = [1 1 0]; % essc

b(1).CData(17,:) = [0.47 0.67 0.19];
b(1).CData(18,:) = [0.301 0.745 0.933];

%% AXIS CONFIGURATION Aqui puedo hubicar cada posición 
yticks([3.5 10.5 17.5]);
yticklabels({'Sinc','Gaussian','Chirp'});
xlim([0 50])  % Set X-axis range
xlabel('Time[ms]');
% ylabel('Groups');
ax = gca;
ax.FontName = 'Times New Roman';
% legend('KNN','NB','SVM','MLP','1D-CNN 256pt.','1D-CNN 1024pt.','Location','southeast');
%% CUSTOM LEGEND
hold on
p0 = patch(NaN,NaN,[1 1 0]);    % essc
p1 = patch(NaN,NaN,[0 0.45 0.74]);       % KNN
p2 = patch(NaN,NaN,[0.85 0.33 0.10]);    % NB
p3 = patch(NaN,NaN,[0.929 0.694 0.125]); % SVM
p4 = patch(NaN,NaN,[0.49 0.18 0.56]);    % MLP
p5 = patch(NaN,NaN,[0.47 0.67 0.19]);    % CNN_256
p6 = patch(NaN,NaN,[0.301 0.745 0.933]);    % CNN_1024

% legend([p0 p1 p2 p3 p4 p5 p6], ...
%        {'ESSC preprocessing Method','KNN','NB','SVM','MLP','1D-CNN 256pt.','1D-CNN 1024pt.'}, ...
%        'Location','southeast');
legend([p6 p5 p4 p3 p2 p1 p0], ...
       {'1D-CNN 1024pt.','1D-CNN 256pt.','MLP','SVM','NB','KNN','ESSC pre-processing method'}, ...
       'Location','southeast');
grid on;

