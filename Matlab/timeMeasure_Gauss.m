% Measure execution time.
clear all;

load gauss_exportedTrainedModels.mat; % Test element
load gauss_gauss1_25dB_testElement.mat; % Test element
% Set right workspace session file to load trained model


f = @() cnn_computingTime(Gauss_KNN_30ESSC_trainedModel.predictFcn, gauss_gauss1_time, gauss_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t1 = mean(timeArray);
std_t1 = std(timeArray);

% -------------------------------------------------------------------------

% Set right workspace session file to load trained model



f = @() cnn_computingTime(Gauss_NB_30ESSC_trainedModel.predictFcn, gauss_gauss1_time, gauss_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t2 = mean(timeArray);
std_t2 = std(timeArray);

% -------------------------------------------------------------------------
% Set right workspace session file to load trained model



f = @() cnn_computingTime(Gauss_SVM_30ESSC_trainedModel.predictFcn,gauss_gauss1_time, gauss_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t3 = mean(timeArray);
std_t3 = std(timeArray);
% -------------------------------------------------------------------------
% Set right workspace session file to load trained model
 


f = @() cnn_computingTime(Gauss_MLP_30ESSC_trainedModel.predictFcn, gauss_gauss1_time, gauss_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t4 = mean(timeArray);
std_t4 = std(timeArray);




timeModelMAt = [av_t1,av_t2,av_t3,av_t4;std_t1,std_t2,std_t3,std_t4];

save('GausstimeModelMat','timeModelMAt');