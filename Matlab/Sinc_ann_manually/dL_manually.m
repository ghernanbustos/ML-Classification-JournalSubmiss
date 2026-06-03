% Build manually MLP model importing weights and bias from Classification
% Learner trained model.
% Generate Confusion Matrix for different Data Test 25,20,15 and 10.
% To build the MLP model use Deep Learning Toolbox as Classification
% Learner App does.

% Manually Standardize with Saved Parameters
% If your Classification Learner model already standardized during training, 
% you need to apply the same mu and sigma to new data. Additionally, 
% standardization helps in improving the convergence speed of gradient 
% descent-based algorithms by ensuring that all features contribute equally 
% to the model.

% Always check if Classification Learner Tool Box applied standardization
% to the data. You can embed this step when building manually or prepare
% the data before classifying

clear all, clc;
% -------------------------------------------------------------------------
load sinc_workspace.mat; % DataSets
load sinc_exportedTrainedModels_BIS.mat; % Model exporterd from Classification Learner app.

% Data declaration
[n_element,n_features] = size(dataSet_30params_train25db_numberedLabel(:,1:30)) % 31 is for label
predictlabelmat = zeros(n_element,1);

% Extract Weghts from trained MODEL.
W1 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{1};  % (8x30)
W2 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{2}; % (3x8)
% W3 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{3}; % (5x3)

b1 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{1}; % (8x1)
b2 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{2}; % (3x1)
% b3 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{3}; % (5x1)

[layer1_size,~] = size(Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{1});
[layer2_size,~] = size(Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{2});
% [layer3_size,~] = size(Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{3});

% For Standardization
mu_parameter    = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.Mu;
sigma_parameter = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.Sigma;

% Build MLP Layers
layers = [
    featureInputLayer(30, 'Name', 'input')

    fullyConnectedLayer(layer1_size, ...
        'Name', 'fc1', ...
        "Weights", W1, ...
        "Bias", b1)

    sigmoidLayer('Name', 'sigmoid1')

    fullyConnectedLayer(layer2_size, ...
        'Name', 'fc2', ...
        "Weights", W2, ...
        "Bias", b2)

    % tanhLayer('Name', 'tanh2')
    % 
    % fullyConnectedLayer(layer3_size, ...
    %     'Name', 'fc3', ...
    %     "Weights", W3, ...
    %     "Bias", b3) % Output layer (5 classes)

    softmaxLayer('Name', 'softmax')
];

% NetWork object
lgraph = layerGraph(layers);
netSinc = dlnetwork(lgraph);  % Now it's ready and pretrained!
save('sinc_mlp_dl_model.mat', 'netSinc'); % Save Net Object to use in other script
% To check FOOTPRINT size.
ml_compact = compact(Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork)
% 

% ----------------------- Standarized Data --------------------------------
% -------------------------------------------------------------------------
%           Change X dataset assignment for differents MC.

X = dataSet_30params_test10db_numberedLabel(:,1:30);
Xstandardized = (X - mu_parameter) ./ sigma_parameter;
dlInput = dlarray(Xstandardized', 'CB'); % Trasponse Data input
% predict
softmaxOutput = predict(netSinc, dlInput);
predictedRawSoftmax = extractdata(softmaxOutput);          % dlarray -> regular number

for i = 1:n_element
    [~, predictlabelmat(i,1)] = max(predictedRawSoftmax(:,i), [], 1);
end

% % All DataSet -------------------------------------------------------------
% % Manually change 'dataSet_30params_test XX db_numberedLabel' to print MC
% % with different DATASETs
% testData    = dataSet_30params_test10db_numberedLabel(:,1:30);  % Gets only the paramaters, last colum is for labeling
% % Convert to dlarray
% dlInput = dlarray(testData', 'CB'); % Trasponse Data input
% % predict
% softmaxOutput = predict(netSinc, dlInput);
% % Raw SoftMax Output
% predictedRawSoftmax = extractdata(softmaxOutput)          % dlarray -> regular number
% for i = 1:n_element
%     [~, predictlabelmat(i,1)] = max(predictedRawSoftmax(:,i), [], 1);
% end

% -------------------------------------------------------------------------
% MC NO averaged 
% Plot CM with row and columns labled.
    classLabel = {'ND', 'FG1', 'FG2', 'FLP1', 'FLP2'};
    % Convert labels to categorical with fixed order
    trueLabels = categorical(dataSet_30params_test10db_numberedLabel(:,31), 1:5, classLabel);
    predictedLabels = categorical(predictlabelmat, 1:5, classLabel);
    cm = confusionmat(trueLabels,predictedLabels) 
    % confusionchart(trueLabels, predictedLabels);
    % Plot confusion chart
        cm =confusionchart(trueLabels, predictedLabels);
        cm.FontName = 'Helvetic';     % Change font (e.g., 'Times New Roman', 'Courier New', etc.)
        cm.FontSize = 10;          % Change font size
        % cm.Normalization = 'row-normalized';   % Optional: normalize by row
        cm.DiagonalColor = 	[0.85 0.33 0.10];         % Optional: highlight diagonal
        % cm.TextColor = 'black';                % Color of matrix numbers

% MC averaged 
%  ======================================================================
   % MC_prom_Num = 1000;   
   % probfixLabels = [1;2;3;4;5];
   % 
   % nameLabels = {'NoDef' 'Gauss1' 'Gauss2' 'PB1' 'PB2'};
   % numLabels = [1 2 3 4 5];
   % numCat = size(numLabels,2);
   % Catlabels = categorical(numLabels,[1 2 3 4 5],nameLabels);
   % %Falta mandar la lista de labelsss numLabels
   % C = CM_func_average(MC_prom_Num,probfixLabels,numCat,Target_Label,predictedRawSoftmax);
   % figure
   %  CM =  confusionchart(C,Catlabels); 
   %    set(gca, 'FontSize', 12);     
   % 
   %  CM.FontName = 'Helvetica';     % Change font (e.g., 'Times New Roman', 'Courier New', etc.)
   %  CM.FontSize = 12;          % Change font size
   %  % cm.Normalization = 'row-normalized';   % Optional: normalize by row
   %  CM.DiagonalColor = 	[0.85 0.33 0.10];         % Optional: highlight diagonal
   %  % cm.TextColor = 'black';                % Color of matrix numbers

