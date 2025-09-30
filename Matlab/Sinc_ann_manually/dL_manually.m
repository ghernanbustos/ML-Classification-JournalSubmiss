% Build manually MLP model importing weights and bias from Classification
% Learner trained model.
% Generate Confusion Matrix for different Data Test 25,20,15 and 10.
% To build the MLP model use Deep Learning Toolbox as Classification
% Learner App does.
clear all, clc;
% -------------------------------------------------------------------------
load sinc_dataSets.mat; % DataSets
load sinc_mlp_clearner_model.mat; % Model exporterd from Classification Learner app.

% Data declaration
[n_element,n_features] = size(dataSet_30params_train25db_numberedLabel(:,1:30)) % 31 is for label
predictlabelmat = zeros(n_element,1);

% Extract Weghts from trained MODEL.
W1 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{1};  % (8x30)
W2 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{2}; % (3x8)
W3 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerWeights{3}; % (5x3)

b1 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{1}; % (8x1)
b2 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{2}; % (3x1)
b3 = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.LayerBiases{3}; % (5x1)

% Build MLP Layers
layers = [
    featureInputLayer(30, 'Name', 'input')

    fullyConnectedLayer(8, ...
        'Name', 'fc1', ...
        "Weights", W1, ...
        "Bias", b1)

    tanhLayer('Name', 'tanh1')

    fullyConnectedLayer(3, ...
        'Name', 'fc2', ...
        "Weights", W2, ...
        "Bias", b2)

    tanhLayer('Name', 'tanh2')

    fullyConnectedLayer(5, ...
        'Name', 'fc3', ...
        "Weights", W3, ...
        "Bias", b3) % Output layer (5 classes)

    softmaxLayer('Name', 'softmax')
];

% NetWork object
lgraph = layerGraph(layers);
netSinc = dlnetwork(lgraph);  % Now it's ready and pretrained!
save('sinc_mlp_dl_model.mat', 'netSinc'); % Save Net Object to use in other script

% 

% All DataSet -------------------------------------------------------------
% Manually change 'dataSet_30params_test XX db_numberedLabel' to print MC
% with different DATASETs
testData    = dataSet_30params_test10db_numberedLabel(:,1:30);  % Gets only the paramaters, last colum is for labeling
% Convert to dlarray
dlInput = dlarray(testData', 'CB'); % Trasponse Data input
% predict
softmaxOutput = predict(netSinc, dlInput);
% Raw SoftMax Output
predictedRawSoftmax = extractdata(softmaxOutput)          % dlarray -> regular number
for i = 1:n_element
    [~, predictlabelmat(i,1)] = max(predictedRawSoftmax(:,i), [], 1);
end

% -------------------------------------------------------------------------
% MC NO averaged 
% Plot CM with row and columns labled.
    classLabel = {'ND', 'G1', 'G2', 'PB1', 'PB2'};
    % Convert labels to categorical with fixed order
    trueLabels = categorical(dataSet_30params_train25db_numberedLabel(:,31), 1:5, classLabel);
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

