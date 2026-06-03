% % Measure execution time.
% clear all;
% clc;
% 
% load chirp_exportedTrainedModels.mat; % Test element
% load chirp_gauss1_25dB_testElement.mat; % Test element
% % Set right workspace session file to load trained model
% 
% 
% f = @() cnn_computingTime(Chirp_KNN_30ESSC_trainedModel.predictFcn, chirp_gauss1_time, chirp_gauss1_amp); % handle to function
% 
% nTimer = 100;
% timeArray = zeros(nTimer,1);
% 
% for i= 1: nTimer
%     timeArray(i,:) =  timeit(f);
% end
% 
% av_t1 = mean(timeArray);
% std_t1 = std(timeArray);
% 
% % -------------------------------------------------------------------------
% 
% % Set right workspace session file to load trained model
% 
% 
% 
% f = @() cnn_computingTime(Chirp_NB_30ESSC_trainedModel.predictFcn, chirp_gauss1_time, chirp_gauss1_amp); % handle to function
% 
% nTimer = 100;
% timeArray = zeros(nTimer,1);
% 
% for i= 1: nTimer
%     timeArray(i,:) =  timeit(f);
% end
% 
% av_t2 = mean(timeArray);
% std_t2 = std(timeArray);
% 
% % -------------------------------------------------------------------------
% % Set right workspace session file to load trained model
% 
% 
% 
% f = @() cnn_computingTime(Chirp_SVM_30ESSC_trainedModel.predictFcn,chirp_gauss1_time, chirp_gauss1_amp); % handle to function
% 
% nTimer = 100;
% timeArray = zeros(nTimer,1);
% 
% for i= 1: nTimer
%     timeArray(i,:) =  timeit(f);
% end
% 
% av_t3 = mean(timeArray);
% std_t3 = std(timeArray);
% % -------------------------------------------------------------------------
% % Set right workspace session file to load trained model
% 
% 
% 
% f = @() cnn_computingTime(Chirp_MLP_30ESSC_trainedModel.predictFcn, chirp_gauss1_time, chirp_gauss1_amp); % handle to function
% 
% nTimer = 100;
% timeArray = zeros(nTimer,1);
% 
% for i= 1: nTimer
%     timeArray(i,:) =  timeit(f);
% end
% 
% av_t4 = mean(timeArray);
% std_t4 = std(timeArray);
% 
% 
% 
% timeModelMAt = [av_t1,av_t2,av_t3,av_t4;std_t1,std_t2,std_t3,std_t4];
% 
% save('Chirp_timeModelMat','timeModelMAt');

% Measure execution time.
% Measure one element classification computation time
% It is gauss waveform filtered with Gaussian filter.
clear all;clc;

% Set right workspace session file to load trained model
load chirp_exportedTrainedModels_BIS.mat; % Loads Trainned Models
% Loads One Raw chirp DataWaveform (amp, time) with Gaussian deformation type.
load chirp_gauss1_25dB_testElement.mat; 

% Manual extraction to be use by f_net
esscParams = essc_computingTime(chirp_gauss1_time, chirp_gauss1_amp); 
% -------------------------------------------------------------------------
nTimer = 100;
timeArray_essc = zeros(nTimer,1);
timeArray_net = zeros(nTimer,1);
timeArray_endToend = zeros(nTimer,1);
% -------------------------------------------------------------------------


% Function Handle ---------------------------------------------------------
f_essc = @() essc_computingTime(chirp_gauss1_time, chirp_gauss1_amp); 
f_net = @() net_computingTime(Chirp_MLP_30ESSC_trainedModel.predictFcn, esscParams); % handle to function
f = @() cnn_computingTime(Chirp_MLP_30ESSC_trainedModel.predictFcn, chirp_gauss1_time, chirp_gauss1_amp); % handle to function


% ESSC preprocessing stage
for i= 1: nTimer
    timeArray_essc(i,:) =  timeit(f_essc);
end

% Machine Learning Network stage
for i= 1: nTimer
    timeArray_net(i,:) =  timeit(f_net);
end

% End To End (ESSC+Machine Learning Model)
for i= 1: nTimer
    timeArray_endToend(i,:) =  timeit(f);
end

av_t1_essc = mean(timeArray_essc);
std_t1_essc = std(timeArray_essc);

av_t1_net = mean(timeArray_net);
std_t1_net = std(timeArray_net);

av_t1_endToend = mean(timeArray_endToend);
std_t1_endToend = std(timeArray_endToend);


% -------------------------------------------------------------------------

f_essc = @() essc_computingTime(chirp_gauss1_time, chirp_gauss1_amp); 
f_net = @() net_computingTime(Chirp_SVM_30ESSC_trainedModel.predictFcn, esscParams); % handle to function
f = @() cnn_computingTime(Chirp_SVM_30ESSC_trainedModel.predictFcn, chirp_gauss1_time, chirp_gauss1_amp); % handle to function


% ESSC preprocessing stage
for i= 1: nTimer
    timeArray_essc(i,:) =  timeit(f_essc);
end

% Machine Learning Network stage
for i= 1: nTimer
    timeArray_net(i,:) =  timeit(f_net);
end

% End To End (ESSC+Machine Learning Model)
for i= 1: nTimer
    timeArray_endToend(i,:) =  timeit(f);
end

av_t2_essc = mean(timeArray_essc);
std_t2_essc = std(timeArray_essc);

av_t2_net = mean(timeArray_net);
std_t2_net = std(timeArray_net);

av_t2_endToend = mean(timeArray_endToend);
std_t2_endToend = std(timeArray_endToend);

% -------------------------------------------------------------------------

f_essc = @() essc_computingTime(chirp_gauss1_time, chirp_gauss1_amp); 
f_net = @() net_computingTime(Chirp_NB_30ESSC_trainedModel.predictFcn, esscParams); % handle to function
f = @() cnn_computingTime(Chirp_NB_30ESSC_trainedModel.predictFcn, chirp_gauss1_time, chirp_gauss1_amp); % handle to function


% ESSC preprocessing stage
for i= 1: nTimer
    timeArray_essc(i,:) =  timeit(f_essc);
end

% Machine Learning Network stage
for i= 1: nTimer
    timeArray_net(i,:) =  timeit(f_net);
end

% End To End (ESSC+Machine Learning Model)
for i= 1: nTimer
    timeArray_endToend(i,:) =  timeit(f);
end

av_t3_essc = mean(timeArray_essc);
std_t3_essc = std(timeArray_essc);

av_t3_net = mean(timeArray_net);
std_t3_net = std(timeArray_net);

av_t3_endToend = mean(timeArray_endToend);
std_t3_endToend = std(timeArray_endToend);
% -------------------------------------------------------------------------

f_essc = @() essc_computingTime(chirp_gauss1_time, chirp_gauss1_amp); 
f_net = @() net_computingTime(Chirp_KNN_30ESSC_trainedModel.predictFcn, esscParams); % handle to function
f = @() cnn_computingTime(Chirp_KNN_30ESSC_trainedModel.predictFcn, chirp_gauss1_time, chirp_gauss1_amp); % handle to function


% ESSC preprocessing stage
for i= 1: nTimer
    timeArray_essc(i,:) =  timeit(f_essc);
end

% Machine Learning Network stage
for i= 1: 1000
    timeArray_net(i,:) =  timeit(f_net);
end

% End To End (ESSC+Machine Learning Model)
for i= 1: nTimer
    timeArray_endToend(i,:) =  timeit(f);
end

av_t4_essc = mean(timeArray_essc);
std_t4_essc = std(timeArray_essc);

av_t4_net = mean(timeArray_net);
std_t4_net = std(timeArray_net);

av_t4_endToend = mean(timeArray_endToend);
std_t4_endToend = std(timeArray_endToend);



timeModelMAt_essc       = [av_t1_essc,av_t2_essc,av_t3_essc,av_t4_essc;
                            std_t1_essc,std_t2_essc,std_t3_essc,std_t4_essc];

timeModelMAt_net        = [av_t1_net,av_t2_net,av_t3_net,av_t4_net;
                            std_t1_net,std_t2_net,std_t3_net,std_t4_net];

timeModelMAt_endToend   = [av_t1_endToend,av_t2_endToend,av_t3_endToend,av_t4_endToend;
                            std_t1_endToend,std_t2_endToend,std_t3_endToend,std_t4_endToend];

display(timeModelMAt_essc);
display(timeModelMAt_net);
display(timeModelMAt_endToend);


save('Chirp_timeModelMAt_essc','timeModelMAt_essc');
save('Chirp_timeModelMAt_net','timeModelMAt_net');
save('Chirp_timeModelMAt_endToend','timeModelMAt_endToend');