% Plots in same window Acc % imported from Classification Learner manually

%---------------------------------------------------
%  25db Raw
figure1 = figure('Color',[1 1 1]);
    subplot(4,3,1)
        x = ["KNN" "NB" "SVM" "MLP" "CNN"];
        y = [100 100 ; 99.9 100 ; 100 100 ; 100 100 ; 99.76 99.60];
        
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
        y = [79.3 83.7 ;61.1 84.2 ;81.0 87.4 ;66.3 96.8; 98.56 99.88]; 
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
        y = [99.2 100; 96.1 100 ; 99.4 100; 99.4 100; 100 99.60];
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
        y = [86.4	89.2; 88.3	88.3; 86.1	89.0; 85.6 88.7; 95.78 98.06];
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
        y = [65.5 71.8 ;58.0 62.0 ;65.3 79.1 ;61.1 87.9; 92.66 96.28];
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
        y = [95.1 98.5 ;83.7 98.3 ;94.7 99.9 ;93.1 97.7; 98.06 94.04]; 
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
        y = [71.3 68.7 ;69.6 68.5 ;70.2 69.4 ;68.3 71.7; 77.64 86.78]; 
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
        y = [24.4 24.3; 37.3 23.6; 30.6 37.8; 16.3 22.9; 76.58 83.42];
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
        y = [78.2 81.6 ;50.3 79.6; 68.9 97.2; 68.0 81.8; 77.62 71.82];
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
        y = [42.8 49.3; 39.2 35.6; 41.0 51.8; 37.0 49.4; 53.76 60.04];
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
        y = [30.5 39.3; 21.5 20; 20 27.2 ;28.7 32.8; 52.12 60];
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
        y = [54.7 51.9; 28.8 48.1; 44.3 87.2; 41.9 45.2; 37.58 49.98];
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