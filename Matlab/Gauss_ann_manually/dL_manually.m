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
load gauss_dataSets.mat; % DataSets
load gauss_mlp_clearner_model.mat; % Model exporterd from Classification Learner app.

% Data declaration
[n_element,n_features] = size(dataSet_gauss_30params_train25db_numberedLabel(:,1:30)); % 31 is for label
predictlabelmat = zeros(n_element,1);

% Extract Weghts from trained MODEL.
W1 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{1}; 
W2 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{2}; 
W3 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{3}; 
% W4 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{4}; 

b1 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{1}; 
b2 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{2}; 
b3 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{3}; 
% b4 = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{4}; 

[layer1_size,~] = size(Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{1});
[layer2_size,~] = size(Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{2});
[layer3_size,~] = size(Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{3});

% For Standardization
mu_parameter    = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.Mu;
sigma_parameter = Gauss_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.Sigma;
% Build MLP Layers
layers = [
    featureInputLayer(30, 'Name', 'input')

    fullyConnectedLayer(layer1_size, ...
        'Name', 'fc1', ...
        "Weights", W1, ...
        "Bias", b1)

    % tanhLayer('Name', 'tanh1') 

    fullyConnectedLayer(layer2_size, ...
        'Name', 'fc2', ...
        "Weights", W2, ...
        "Bias", b2)

    % tanhLayer('Name', 'tanh2')

    fullyConnectedLayer(layer3_size, ...
        'Name', 'fc3', ...
        "Weights", W3, ...
        "Bias", b3) % Output layer (5 classes)

    % tanhLayer('Name', 'tanh3')
    % 
    % fullyConnectedLayer(5, ...
    %     'Name', 'fc4', ...
    %     "Weights", W4, ...
    %     "Bias", b4) % Output layer (5 classes)

    softmaxLayer('Name', 'softmax')
];

% Create NetWork object
lgraph = layerGraph(layers);
netGauss = dlnetwork(lgraph);  % Now it's ready and pretrained!

save('gauss_mlp_dl_model.mat', 'netGauss'); % Save Net Object to use in other script


% ----------------------- Standarized Data --------------------------------
% -------------------------------------------------------------------------
%           Change X dataset assignment for differents MC.

X = dataSet_gauss_30params_test10db_numberedLabel(:,1:30);
Xstandardized = (X - mu_parameter) ./ sigma_parameter;
dlInput = dlarray(Xstandardized', 'CB'); % Trasponse Data input
% predict
softmaxOutput = predict(netGauss, dlInput);
predictedRawSoftmax = extractdata(softmaxOutput)          % dlarray -> regular number

for i = 1:n_element
    [~, predictlabelmat(i,1)] = max(predictedRawSoftmax(:,i), [], 1);
end

% -------------------------------------------------------------------------
% Plot CM with row and columns labled.
    classLabel = {'ND', 'G1', 'G2', 'PB1', 'PB2'};
    % Convert labels to categorical with fixed order
    trueLabels = categorical(dataSet_gauss_30params_test25db_numberedLabel(:,31), 1:5, classLabel);
    predictedLabels = categorical(predictlabelmat, 1:5, classLabel);
    cm = confusionmat(trueLabels,predictedLabels) 
    % confusionchart(trueLabels, predictedLabels);
    % Plot confusion chart
        cm =confusionchart(trueLabels, predictedLabels);
        cm.FontName = 'Helvetica';     % Change font (e.g., 'Times New Roman', 'Courier New', etc.)
        cm.FontSize = 12;          % Change font size
        % cm.Normalization = 'row-normalized';   % Optional: normalize by row
        cm.DiagonalColor = 	[0.85 0.33 0.10];         % Optional: highlight diagonal
        % cm.TextColor = 'black';                % Color of matrix numbers

% MC averaged 
%  ------------------------------------------------------------------------
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


