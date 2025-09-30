load('gauss_workspace.mat')

% ------- Prepare ordered Balanced DataSet to randomly shuffle for training 
%               Generate a random permutation of indices
%           Label is in last column
[numObservations,numLabels] = size(dataSet_gauss_30params_train25db_numberedLabel);
randomIndices = randperm(numObservations);

%Shuffled for 4 and 30 features
TrainMat_30param_Gauss_25dB_shuffle = dataSet_gauss_30params_train25db_numberedLabel(randomIndices,:); 
TrainMat_4param_Gauss_25dB_shuffle = dataSet_gauss_4params_train25db_numberedLabel(randomIndices,:); 
