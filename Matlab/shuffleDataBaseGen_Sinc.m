load('sinc_workspace.mat')

% ------- Prepare ordered Balanced DataSet to randomly shuffle for training 
%               Generate a random permutation of indices
%           Label is in last column
[numObservations,numLabels] = size(dataSet_30params_train25db_numberedLabel);
randomIndices = randperm(numObservations);

TrainMat_30param_Sinc_25dB_shuffle = dataSet_30params_train25db_numberedLabel(randomIndices,:); 
TrainMat_4param_Sinc_25dB_shuffle = dataSet_4params_train25db_numberedLabel(randomIndices,:); 
