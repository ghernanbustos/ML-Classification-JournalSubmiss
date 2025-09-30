% Measure execution time.
% Measure one element classification computation time
% It is Sinc waveform filtered with Gaussian filter.
clear all;

% Set right workspace session file to load trained model
load sinc_exportedTrainedModels.mat; 
load sinc_gauss1_25dB_testElement.mat; % one element for test


f = @() cnn_computingTime(Sinc_KNN_30ESSC_trainedModel.predictFcn, sinc_gauss1_time, sinc_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t1 = mean(timeArray);
std_t1 = std(timeArray);

% -------------------------------------------------------------------------

f = @() cnn_computingTime(Sinc_NB_30ESSC_trainedModel.predictFcn, sinc_gauss1_time, sinc_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t2 = mean(timeArray);
std_t2 = std(timeArray);

% -------------------------------------------------------------------------

f = @() cnn_computingTime(Sinc_SVM_30ESSC_trainedModel.predictFcn,sinc_gauss1_time, sinc_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t3 = mean(timeArray);
std_t3 = std(timeArray);
% -------------------------------------------------------------------------

f = @() cnn_computingTime(Sinc_MLP_30ESSC_trainedModel.predictFcn, sinc_gauss1_time, sinc_gauss1_amp); % handle to function

nTimer = 100;
timeArray = zeros(nTimer,1);

for i= 1: nTimer
    timeArray(i,:) =  timeit(f);
end

av_t4 = mean(timeArray);
std_t4 = std(timeArray);



timeModelMAt = [av_t1,av_t2,av_t3,av_t4;std_t1,std_t2,std_t3,std_t4];

save('Sinc_timeModelMat','timeModelMAt');