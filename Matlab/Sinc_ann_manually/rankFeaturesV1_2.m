% Ranking Features with k-nearest method
% Check data matrix dimension before excecuting the function
% Links:
% https://www.mathworks.com/help/stats/dimensionality-reduction.html?searchHighlight=relieff&s_tid=srchtitle_relieff_19

% DataSet format 5000x30, where 30 (columns) are ESSC parameters

 % FEATURE RANKING is done by three methods relieff, fscmrmr and fscchi2
 % using an z-score standardize DATASET. 
 % Then a new dataset using the original (no standardize data) but 
 % desordered data (TrainMat_30param_Sinc_25dB_shuffle) is build with 
 % feature subsets, one for the first 5 features, other for the 
 % first 10 ... Each of this dataset is then use by
 % the TOOLBOX Classification Learner to train and test ML algorithms
 
 %  First choose ranking method and generate dataset for test. Then load
 %  classification learner session in the app and test each dataset. 
clear all, clc;
% LOADs DATASET AND THEN STANDARDIZE WITH Z-SCORE

load sinc_workspace.mat; % Loads Train, Test and all formatted datasets.

% All train data at 25db - Define memory allocation for new datasets. (No label included)
train_sinc5subsetparams     = zeros(5000,5);
train_sinc10subsetparams    = zeros(5000,10);
train_sinc15subsetparams    = zeros(5000,15);
train_sinc20subsetparams    = zeros(5000,20);

% Test Subset
test_sinc5subsetparams25db     = zeros(5000,5);
test_sinc5subsetparams20db     = zeros(5000,5);
test_sinc5subsetparams15db     = zeros(5000,5);
test_sinc5subsetparams10db     = zeros(5000,5);

test_sinc10subsetparams25db    = zeros(5000,10);
test_sinc10subsetparams20db    = zeros(5000,10);
test_sinc10subsetparams15db    = zeros(5000,10);
test_sinc10subsetparams10db    = zeros(5000,10);

test_sinc15subsetparams25db  = zeros(5000,15);
test_sinc15subsetparams20    = zeros(5000,15);
test_sinc15subsetparams15    = zeros(5000,15);
test_sinc15subsetparams10    = zeros(5000,15);

test_sinc20subsetparams25db    = zeros(5000,20);
test_sinc20subsetparams20    = zeros(5000,20);
test_sinc20subsetparams15    = zeros(5000,20);
test_sinc20subsetparams10    = zeros(5000,20);

% % catLabetl = categorical(matLabel);
% DataIn      = dataSet_30params_train25db_numberedLabel(:,1:30);
% % DataIn      = TrainMat_30param_Sinc_25dB_shuffle(:,1:30);
% % Relabel with letters each category batch
%    matLabel = cell(5000,1);
%    matLabel(1:1000,1)      = {'a'};
%    matLabel(1001:2000,1)   = {'b'};
%    matLabel(2001:3000,1)   = {'c'};
%    matLabel(3001:4000,1)   = {'d'};
%    matLabel(4001:5000,1)   = {'e'};
% % Relieff
% [idx,SincWeights] = relieff(DataIn(:,:),matLabel(:,:),10);
% % [idx,SincWeights] = fscmrmr(DataIn(:,:),matLabel(:,:));
% % [idx,SincWeights] = fscchi2(DataIn(:,:),matLabel(:,:));
% 
% 
% % Prepare data to plot in descendent order
%    X = {'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
%                     'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
%                     'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'};
% % Order labels with index idx
%    for idx_n = 1:30
%     X_ordered(idx_n) = X(idx(idx_n));
%     SincWeights_ordered(idx_n) = SincWeights(idx(idx_n));
%    end
% 
% X = categorical(X_ordered);
% X = reordercats(X, X_ordered);       % Ensure the order stays in idx order
% 
% 
% figure
%    bar(X,SincWeights_ordered)
%    title('Sinc - RelieFF Method')
%     % Set axis ranges
%     % xlim([0 0.5])  % Replace xmin and xmax with your desired x-axis limits
%     % ylim([0 0.5])  % Replace ymin and ymax with your desired y-axis limits

% =========================================================================
% =========================================================================

% WITH STANDARDIZED DATA --------------------------------------------------

% Load 25DB TRAIN ORDERED DATASET with 30 parameters (ESSC)
DataIn      = dataSet_30params_train25db_numberedLabel(:,1:30);
% Standardize Dataset with Z-score
DataIn_std = normalize(DataIn); % z-score
% Relabel with letters each category batch
   matLabel = cell(5000,1);
   matLabel(1:1000,1)      = {'a'};
   matLabel(1001:2000,1)   = {'b'};
   matLabel(2001:3000,1)   = {'c'};
   matLabel(3001:4000,1)   = {'d'};
   matLabel(4001:5000,1)   = {'e'};

% Select feature Ranking method ===========================================
    % Relieff
    % [idx,SincWeights] = relieff(DataIn_std(:,:),matLabel(:,:),10); flag_relieff = 1; flag_mrmr = 0; flag_chi2 = 0;
    [idx,SincWeights] = fscmrmr(DataIn(:,:),matLabel(:,:)); flag_relieff = 0; flag_mrmr = 1; flag_chi2 = 0;
    % [idx,SincWeights] = fscchi2(DataIn(:,:),matLabel(:,:)); flag_chi2 = 1; flag_relieff = 0; flag_mrmr =0; 

% Prepare data to plot in descendent order
% From 1-10 belong to ESSC Integral Signal, From 11-20 belongs to ESSC
% Signal and 21-30 belongs to ESSC Derivative signal.

   X = {'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
        'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
        'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'};
% Order labels with index idx
   for n_pos = 1:30
    X_ordered(n_pos) = X(idx(n_pos));
    SincWeights_ordered(n_pos) = SincWeights(idx(n_pos));
   end

X = categorical(X_ordered);
X = reordercats(X, X_ordered);       % Ensure the order stays in idx order

figure
   bar(X,SincWeights_ordered)
   title('Sinc')
    % Set axis ranges
    % xlim([0 0.5])  % Replace xmin and xmax with your desired x-axis limits
    % ylim([0 0.5])  % Replace ymin and ymax with your desired y-axis limits
% =========================================================================
% None of the dataset above are standardize, are original to be use by
% Classification Learner toolbox with HPO standardize parameter active
% during training. Data are standardize by toolbox before training the
% algorithms.

if flag_relieff == 1
    for n = 1:5
        train_sinc5subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)); % Train Dataset has to be shuffle and not standardized then toolbox does it.
        % Extra subsets at different SNR
        test_sinc5subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
        test_sinc5subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc5subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc5subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

    for n = 1:10
        train_sinc10subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        % Extra subsets at different SNR
        test_sinc10subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
        test_sinc10subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc10subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc10subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

    for n = 1:15
        train_sinc15subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        % Extra subsets at different SNR
        test_sinc15subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
        test_sinc15subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc15subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc15subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

    for n = 1:20
        train_sinc20subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        % Extra subsets at different SNR
        test_sinc20subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n)); 
        test_sinc20subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc20subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc20subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

% Adds the labels column 31
% Train Subset all at 25dB
    train_sinc5subsetparams  = [train_sinc5subsetparams ,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    train_sinc10subsetparams = [train_sinc10subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)];
    train_sinc15subsetparams = [train_sinc15subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    train_sinc20subsetparams = [train_sinc20subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
% Test Subset 25/20/25/10 SNR
    test_sinc5subsetparams25db = [test_sinc5subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc5subsetparams20db = [test_sinc5subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc5subsetparams15db = [test_sinc5subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc5subsetparams10db = [test_sinc5subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    test_sinc10subsetparams25db = [test_sinc10subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc10subsetparams20db = [test_sinc10subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc10subsetparams15db = [test_sinc10subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc10subsetparams10db = [test_sinc10subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    test_sinc15subsetparams25db = [test_sinc15subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc15subsetparams20db = [test_sinc15subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc15subsetparams15db = [test_sinc15subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc15subsetparams10db = [test_sinc15subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    test_sinc20subsetparams25db = [test_sinc20subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc20subsetparams20db = [test_sinc20subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc20subsetparams15db = [test_sinc20subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc20subsetparams10db = [test_sinc20subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    save('RelieFF_Sinc_Workspace');

% % Save Dataset for RelieFF
% % Train at 25db
%     save('RelieFF_train_sinc5subsetparams.mat' , 'train_sinc5subsetparams'); % Save Net Object to use in other script
%     save('RelieFF_train_sinc10subsetparams.mat', 'train_sinc10subsetparams'); % Save Net Object to use in other script
%     save('RelieFF_train_sinc15subsetparams.mat', 'train_sinc15subsetparams'); % Save Net Object to use in other script
%     save('RelieFF_train_sinc20subsetparams.mat', 'train_sinc20subsetparams'); % Save Net Object to use in other script
% % Test at 25db
%     save('RelieFF_test_sinc5subsetparams.mat' , 'test_sinc5subsetparams'); % Save Net Object to use in other script
% 
%     save('RelieFF_test_sinc10subsetparams.mat', 'test_sinc10subsetparams'); % Save Net Object to use in other script
% 
%     save('RelieFF_test_sinc15subsetparams.mat', 'test_sinc15subsetparams'); % Save Net Object to use in other script
% 
%     save('RelieFF_test_sinc20subsetparams.mat', 'test_sinc20subsetparams'); % Save Net Object to use in other script


 
elseif flag_mrmr == 1
    for n = 1:5
        train_sinc5subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)); % Train Dataset has to be shuffle and not standardized then toolbox does it.
        % Extra subsets at different SNR
        test_sinc5subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
        test_sinc5subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc5subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc5subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

    for n = 1:10
        train_sinc10subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        % Extra subsets at different SNR
        test_sinc10subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
        test_sinc10subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc10subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc10subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

    for n = 1:15
        train_sinc15subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        % Extra subsets at different SNR
        test_sinc15subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
        test_sinc15subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc15subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc15subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

    for n = 1:20
        train_sinc20subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        % Extra subsets at different SNR
        test_sinc20subsetparams25db(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n)); 
        test_sinc20subsetparams20db(:,n) = dataSet_30params_test20db_numberedLabel(:,idx(n)); 
        test_sinc20subsetparams15db(:,n) = dataSet_30params_test15db_numberedLabel(:,idx(n));
        test_sinc20subsetparams10db(:,n) = dataSet_30params_test10db_numberedLabel(:,idx(n));
    end

% Adds the labels column 31
% Train Subset all at 25dB
    train_sinc5subsetparams  = [train_sinc5subsetparams ,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    train_sinc10subsetparams = [train_sinc10subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)];
    train_sinc15subsetparams = [train_sinc15subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    train_sinc20subsetparams = [train_sinc20subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
% Test Subset 25/20/25/10 SNR
    test_sinc5subsetparams25db = [test_sinc5subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc5subsetparams20db = [test_sinc5subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc5subsetparams15db = [test_sinc5subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc5subsetparams10db = [test_sinc5subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    test_sinc10subsetparams25db = [test_sinc10subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc10subsetparams20db = [test_sinc10subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc10subsetparams15db = [test_sinc10subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc10subsetparams10db = [test_sinc10subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    test_sinc15subsetparams25db = [test_sinc15subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc15subsetparams20db = [test_sinc15subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc15subsetparams15db = [test_sinc15subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc15subsetparams10db = [test_sinc15subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    test_sinc20subsetparams25db = [test_sinc20subsetparams25db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc20subsetparams20db = [test_sinc20subsetparams20db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc20subsetparams15db = [test_sinc20subsetparams15db,dataSet_30params_test25db_numberedLabel(:,31)]; 
    test_sinc20subsetparams10db = [test_sinc20subsetparams10db,dataSet_30params_test25db_numberedLabel(:,31)]; 

    save('Mrmr_Sinc_Workspace');


% % Save Dataset for RelieFF
%     save('mrmr_train_sinc5subsetparams.mat' , 'train_sinc5subsetparams'); % Save Net Object to use in other script
%     save('mrmr_train_sinc10subsetparams.mat', 'train_sinc10subsetparams'); % Save Net Object to use in other script
%     save('mrmr_train_sinc15subsetparams.mat', 'train_sinc15subsetparams'); % Save Net Object to use in other script
%     save('mrmr_train_sinc20subsetparams.mat', 'train_sinc20subsetparams'); % Save Net Object to use in other script
% 
%     save('mrmr_test_sinc5subsetparams.mat' , 'test_sinc5subsetparams'); % Save Net Object to use in other script
%     save('mrmr_test_sinc10subsetparams.mat', 'test_sinc10subsetparams'); % Save Net Object to use in other script
%     save('mrmr_test_sinc15subsetparams.mat', 'test_sinc15subsetparams'); % Save Net Object to use in other script
%     save('mrmr_test_sinc20subsetparams.mat', 'test_sinc20subsetparams'); % Save Net Object to use in other script

elseif flag_chi2 == 1
    for n = 1:5
        train_sinc5subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)); 
        test_sinc5subsetparams(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
    end

    for n = 1:10
        train_sinc10subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        test_sinc10subsetparams(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
    end

    for n = 1:15
        train_sinc15subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        test_sinc15subsetparams(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
    end


    for n = 1:20
        train_sinc20subsetparams(:,n) = TrainMat_30param_Sinc_25dB_shuffle(:,idx(n)) ;
        test_sinc20subsetparams(:,n) = dataSet_30params_test25db_numberedLabel(:,idx(n));  
    end
% Adds the labels column 31
 
    train_sinc5subsetparams = [train_sinc5subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    test_sinc5subsetparams  = [test_sinc5subsetparams,dataSet_30params_test25db_numberedLabel(:,31)]; 

    train_sinc10subsetparams = [train_sinc10subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    test_sinc10subsetparams  = [test_sinc10subsetparams,dataSet_30params_test25db_numberedLabel(:,31)]; 

    train_sinc15subsetparams = [train_sinc15subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    test_sinc15subsetparams  = [test_sinc15subsetparams,dataSet_30params_test25db_numberedLabel(:,31)]; 

    train_sinc20subsetparams = [train_sinc20subsetparams,TrainMat_30param_Sinc_25dB_shuffle(:,31)]; 
    test_sinc20subsetparams  = [test_sinc20subsetparams,dataSet_30params_test25db_numberedLabel(:,31)]; 
% Save Dataset for RelieFF
    save('chi2_train_sinc5subsetparams.mat' , 'train_sinc5subsetparams'); % Save Net Object to use in other script
    save('chi2_train_sinc10subsetparams.mat', 'train_sinc10subsetparams'); % Save Net Object to use in other script
    save('chi2_train_sinc15subsetparams.mat', 'train_sinc15subsetparams'); % Save Net Object to use in other script
    save('chi2_train_sinc20subsetparams.mat', 'train_sinc20subsetparams'); % Save Net Object to use in other script

    save('chi2_test_sinc5subsetparams.mat' , 'test_sinc5subsetparams'); % Save Net Object to use in other script
    save('chi2_test_sinc10subsetparams.mat', 'test_sinc10subsetparams'); % Save Net Object to use in other script
    save('chi2_test_sinc15subsetparams.mat', 'test_sinc15subsetparams'); % Save Net Object to use in other script
    save('chi2_test_sinc20subsetparams.mat', 'test_sinc20subsetparams'); % Save Net Object to use in other script
end














