% Plots in same window Acc % imported from Classification Learner manually

%---------------------------------------------------
%  25db Raw
figure1 = figure('Color',[1 1 1]);
    subplot(4,3,1)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [100	100 ; 99.9 100 ; 100 100 ; 100 100 ; 97	99.42];
        
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;

    subplot(4,3,2)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [80.42	84.64 ;61.12	84.22 ;81.44	97.44 ;66.46	96.32; 93.14	97.92]; 
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;
    subplot(4,3,3)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [99.24	99.94; 96.14	100 ; 99.08	100; 99.36	99.98; 99.96	99.52];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;

%  20db Raw ------------------------------------------------------------
    subplot(4,3,4)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [89	92.4; 88.3	88.3; 86	85.7; 83.3	95.3; 71.76	73.8];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;

    subplot(4,3,5)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [66.18	71.5 ;57.98	61.98;62.94	88.84 ;61.34	85.7; 76.72	78.66];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;

    subplot(4,3,6)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [95.1	98.12 ;83.7	98.32 ;93.96	99.88 ;92.54	99.56; 79.36	68.82]; 
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;



%  15db Raw ------------------------------------------------------------
    subplot(4,3,7)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [75.22	69.84 ;69.62	68.54 ;70.1	72.14;67.24	72.88; 40	32.2]; 
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;
    subplot(4,3,8) 
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [21.02	25.06; 37.3	23.58; 29.14	23.82; 15.06	39.5;52.92	45.34];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;
    subplot(4,3,9) 
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [78.2	78.94 ;50.34	79.6; 69.4	97.2; 69.96	92.42; 46.2	39.82];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;

%  10db Raw ------------------------------------------------------------
    subplot(4,3,10)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [43.98	54.66; 39.18	35.64; 41.28	57.44; 35.46	52.46; 26.54	26.64];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;
    subplot(4,3,11) 
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [29.18	38.44; 21.48	20; 20	33.98 ;30.2	26.1; 28.36	28.34];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;
    subplot(4,3,12) 
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [54.68	48.82; 28.8	48.1; 40.34	87.24; 41.86	67.62; 29.82	29.54];
        % Create grouped bar plot
        b = bar(x, y);
        
        % Customize colors: keep default for first 4 groups, change last group
        % Example: red for 256, blue for 1024
        b(1).FaceColor = 'flat';
        b(2).FaceColor = 'flat';
        
        % Set custom colors for the last bar group (index 5)
        b(1).CData(5,:) = [0 0.5 0];   % Red for '4 SSC' at '256 | 1024'
        b(2).CData(5,:) = [1 1 0];   % Blue for '30 ESSC' at '256 | 1024'
        
        % Legend and formatting
        % lgd = legend({'4 SSC','30 ESSC'}, 'Location','southeast');
        % set(lgd, 'FontSize', 7, 'FontName', 'Times New Roman');
        ax = gca;
        ax.FontName = 'Times New Roman';
        ylim([0 100]);
        % ylabel('Acc %','FontSize',8,'FontName','Arial');
        grid on;