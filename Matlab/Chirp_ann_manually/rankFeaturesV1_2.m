% Ranking Features with k-nearest method
% Check data matrix dimension before excecuting the function
% Links:
% https://www.mathworks.com/help/stats/dimensionality-reduction.html?searchHighlight=relieff&s_tid=srchtitle_relieff_19

clear all, clc;
% DataSets Loading

load chirp_dataSets.mat; % DataSets

% catLabetl = categorical(matLabel);
DataIn      = dataSet_chirp_30params_test25db_numberedLabel(:,1:30);
% Relabel with letters each category batch
   matLabel = cell(5000,1);
   matLabel(1:1000,1)      = {'a'};
   matLabel(1001:2000,1)   = {'b'};
   matLabel(2001:3000,1)   = {'c'};
   matLabel(3001:4000,1)   = {'d'};
   matLabel(4001:5000,1)   = {'e'};
% Relieff
[idx,ChirpWeights] = relieff(DataIn(:,:),matLabel(:,:),10);

% Prepare data to plot in descendent order
   X = {'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                    'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                    'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'};
% Order labels with index idx
   for idx_n = 1:30
    X_ordered(idx_n) = X(idx(idx_n));
    ChirpWeights_ordered(idx_n) = ChirpWeights(idx(idx_n));
   end

X = categorical(X_ordered);
X = reordercats(X, X_ordered);       % Ensure the order stays in idx order


figure
    bar(X,ChirpWeights_ordered)
    title('Chirp - RelieFF Method', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Arial')
    
    % xlabel('Feature Index', 'FontSize', 14, 'FontName', 'Arial')
    % ylabel('Weight', 'FontSize', 14, 'FontName', 'Arial')
    
    % Set axis ranges
    % xlim([0 0.5])  % Replace xmin and xmax with your desired x-axis limits
    ylim([0 0.5])  % Replace ymin and ymax with your desired y-axis limits
    
    % Customize axes
    set(gca, 'FontSize', 12, 'FontName', 'Arial', 'Box', 'off', 'LineWidth', 1.2)

