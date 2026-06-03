% Project: Feature Analysis Sensitivity
% Author: Guillermo Bustos
% This script analyzes the Sensitivity Neural Network Outputs doing a variation
% of every input feature in terms of differents std values.

% netSinc: 
% InputData =  30x1; then it has to be converted to dlarray{}, so
% ann_output = predict(netSinc,dlarray{InputData});
% ann_output is array type, need to be converted to double or simple
% datatype. Finally extractdata() to convert dlarray data to simple.
% 
% Dont forget to standardize input data if neural model requires.

%  j = column index (Class)
%  i = row index    (Feature)
clear all, clc;
close all;
% *************************************************************************
% Load all Data sets and ANN models.
% Load Test dataset "Test"
load sinc_workspace.mat; % DataSets
load sinc_mlp_dl_model.mat; % Model Build manually to extract raw output data from softmax.
load sinc_exportedTrainedModels_BIS.mat;

% Get mu and sigma from z-score to normalize dataset, MLP model was trainned
% with standardize data. While training the network data was standardize.

% Format dataset to be ready to use as input 
mu_parameter    = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.Mu;
sigma_parameter = Sinc_MLP_30ESSC_trainedModel.ClassificationNeuralNetwork.Sigma;

X = dataSet_30params_test25db_numberedLabel(:,1:30); % only params, not labels
Xstandardized = (X - mu_parameter) ./ sigma_parameter;
% -------------------------------------------------------------------------


% Transpose dataset to fit with Ann model input
TestMat_Sinc_25dB = Xstandardized(:,1:30)'; 
% *************************************************************************
% New deltaSigma array
   k = (log(10)-log(0.01))/29;
   A = 0.01*exp(-k);
   deltaSigmaArray = A*exp(k*(1:1:30));
   plot(deltaSigmaArray,'-o');
   % deltaSigmaArray = [0:0.01:0.1,0.2:0.1:1,2,4,8,16,32,64,128]; 
   % deltaSigmaArray = [0.0001];
   % deltaSigmaArray = deltaSigmaArray ./ 100; 
   % deltaSigmaArray = [0:0.1:10];

   p_room_val =0.9;

% Extract every Data labeled Batch to calculate u, sigma and std
 
   NUM_PARAM   = 30;
   NUM_CLASS   = 5;

   dimBatch    = size(TestMat_Sinc_25dB,2);  % 5000 Full size
   subdimBatch = dimBatch /NUM_CLASS;      % 1000 Class size
   
   auxVar               = zeros(NUM_PARAM, 1);
   deltaFeature         = 0;
   sigmaMax             = 0;  
   muMat_inputESSC      = zeros(NUM_PARAM, NUM_CLASS); % Input parameters mean
   sigmaMat_inputESSC   = zeros(NUM_PARAM, NUM_CLASS); % Output ANN desviation label
%    annOutput_piMat      = zeros(NUM_CLASS, size(nArray,2)); % Mat with deltas outputs
   output_deltaSigma     = zeros(NUM_PARAM, NUM_CLASS);% Store output ANN mean and variance
   
% Calc row average and std, we have two Matrix where every column has each
% feature mean and std.
for jClass = 1: NUM_CLASS
    muMat_inputESSC(:,jClass)    = mean(TestMat_Sinc_25dB(: , ( (((subdimBatch * jClass)+1)-subdimBatch) : (subdimBatch * jClass) )),2);  % Mean "mu"
    % sigmaMat_inputESSC(:,jClass) = std(TestMat_Sinc_25dB (: , ( (((subdimBatch * jClass)+1)-subdimBatch) : (subdimBatch * jClass) )),1,2); % std desviation "sigma"
end
% eliminar luego

% muMat_inputESSC(:,1) = TestMat_Sinc_25dB(:,1);
% muMat_inputESSC(:,2) = TestMat_Sinc_25dB(:,1001);
% muMat_inputESSC(:,3) = TestMat_Sinc_25dB(:,2001);
% muMat_inputESSC(:,4) = TestMat_Sinc_25dB(:,3001);
% muMat_inputESSC(:,5) = TestMat_Sinc_25dB(:,4001);


% Normalization in amplitude Parameters  muMat and  sigmaMat
%    ESSC Integrated parameter
   muMat_inputESSC(3,:)    = (muMat_inputESSC(3,:)) ./ 2;
   muMat_inputESSC(4,:)    = (muMat_inputESSC(4,:)) ./ 2;
   muMat_inputESSC(6,:)    = (muMat_inputESSC(6,:)) ./ 4;
   muMat_inputESSC(7,:)    = (muMat_inputESSC(7,:)) ./ 8;
%    ESSC Signal parameter
   muMat_inputESSC(13,:)   = (muMat_inputESSC(13,:)) ./ 2;
   muMat_inputESSC(14,:)   = (muMat_inputESSC(14,:)) ./ 2;
   muMat_inputESSC(16,:)   = (muMat_inputESSC(16,:)) ./ 4;
   muMat_inputESSC(17,:)   = (muMat_inputESSC(17,:)) ./ 8;
%    ESSC Derivated parameter
   muMat_inputESSC(23,:)   = (muMat_inputESSC(23,:)) ./ 2;
   muMat_inputESSC(24,:)   = (muMat_inputESSC(24,:)) ./ 2;
   muMat_inputESSC(26,:)   = (muMat_inputESSC(26,:)) ./ 4;
   muMat_inputESSC(27,:)   = (muMat_inputESSC(27,:)) ./ 8;

   

% **--------------------------------------------------------------------------**
for jClass = 1 : NUM_CLASS % Number of classes
% flag = 0;
   for iFeature_Std = 1 : NUM_PARAM 
      for i_deltaSigma = 1 : size(deltaSigmaArray,2)
         %------------------POSITIVE---------------------------------------
         auxVar         = muMat_inputESSC(:,jClass);% All colum data
         auxVar(iFeature_Std,1)  = auxVar(iFeature_Std,1) + ...
                                    deltaSigmaArray(i_deltaSigma); % delta one parameter
%          Invert the normalization.
                     %    ESSC Integrated parameter
                        auxVar(3,:)    = (auxVar(3,:)) .* 2;
                        auxVar(4,:)    = (auxVar(4,:)) .* 2;
                        auxVar(6,:)    = (auxVar(6,:)) .* 4;
                        auxVar(7,:)    = (auxVar(7,:)) .* 8;
                     %    ESSC Signal parameter
                        auxVar(13,:)   = (auxVar(13,:)) .* 2;
                        auxVar(14,:)   = (auxVar(14,:)) .* 2;
                        auxVar(16,:)   = (auxVar(16,:)) .* 4;
                        auxVar(17,:)   = (auxVar(17,:)) .* 8;
                     %    ESSC Derivated parameter
                        auxVar(23,:)   = (auxVar(23,:)) .* 2;
                        auxVar(24,:)   = (auxVar(24,:)) .* 2;
                        auxVar(26,:)   = (auxVar(26,:)) .* 4;
                        auxVar(27,:)   = (auxVar(27,:)) .* 8;

        % Convert data to dlarray{} ---------------------------------------
        dlInput = dlarray(auxVar, 'CB'); % Trasponse Data input
        softmaxOutput = predict(netSinc, dlInput);
        predictedRawSoftmax = extractdata(softmaxOutput);          % dlarray -> regular number
        % -----------------------------------------------------------------

         annOutput_piMat(1:5,1) = predictedRawSoftmax;
         if ( annOutput_piMat(jClass,1) < p_room_val )% positive Sigma
            deltaSens = deltaSigmaArray(i_deltaSigma);% Save Sigma value
            break
         end  
         %--------------NEGATIVE ------------------------------------------
         auxVar         = muMat_inputESSC(:,jClass);% All colum data
         auxVar(iFeature_Std,1)  = auxVar(iFeature_Std,1) - ...
                                    deltaSigmaArray(i_deltaSigma); % delta one parameter
%          Invert the normalization.
                     %    ESSC Integrated parameter
                        auxVar(3,:)    = (auxVar(3,:)) .* 2;
                        auxVar(4,:)    = (auxVar(4,:)) .* 2;
                        auxVar(6,:)    = (auxVar(6,:)) .* 4;
                        auxVar(7,:)    = (auxVar(7,:)) .* 8;
                     %    ESSC Signal parameter
                        auxVar(13,:)   = (auxVar(13,:)) .* 2;
                        auxVar(14,:)   = (auxVar(14,:)) .* 2;
                        auxVar(16,:)   = (auxVar(16,:)) .* 4;
                        auxVar(17,:)   = (auxVar(17,:)) .* 8;
                     %    ESSC Derivated parameter
                        auxVar(23,:)   = (auxVar(23,:)) .* 2;
                        auxVar(24,:)   = (auxVar(24,:)) .* 2;
                        auxVar(26,:)   = (auxVar(26,:)) .* 4;
                        auxVar(27,:)   = (auxVar(27,:)) .* 8;

        % Convert data to dlarray{} ---------------------------------------
        dlInput = dlarray(auxVar, 'CB'); % Trasponse Data input
        softmaxOutput = predict(netSinc, dlInput);
        predictedRawSoftmax = extractdata(softmaxOutput);          % dlarray -> regular number
        % -----------------------------------------------------------------
         annOutput_piMat(1:5,1) = predictedRawSoftmax;
         if ( annOutput_piMat(jClass,1) < p_room_val )% negative Sigma
            deltaSens = deltaSigmaArray(i_deltaSigma);% Save Sigma value
            break
         end 
      end 
      output_deltaSigma (iFeature_Std,jClass) = deltaSens; 
   end
end

SensAuxOutput_deltaSigma =  1 ./ output_deltaSigma;

writematrix(SensAuxOutput_deltaSigma)

 

figure 
   subplot(2,3,1)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma(:,1))
      title('Sinc - Deformation: NoDef')
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

   % figure 
   subplot(2,3,2)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma(:,2))
      title('Sinc - Deformation: G1')
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

   % figure 
   subplot(2,3,3)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma(:,3))
      title('Sinc - Deformation: G2')
      xlabel('Extended SSC')
      ylabel('Mean Network Output')

   % figure 
   subplot(2,3,4)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma(:,4))
      title('Sinc - Deformation: PB1')
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

   % figure
   subplot(2,3,5)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma(:,5))
      title('Sinc - Deformation: PB2')
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

      
      
% -----------------------------------------NORMALIZED ---------------------
SensAuxOutput_deltaSigma_std = rescale(SensAuxOutput_deltaSigma,0,1);

figure 
   subplot(2,3,1)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma_std(:,1))
      title('Sinc - Deformation: NoDef')
      ylim([0 1]);
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

   % figure 
   subplot(2,3,2)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma_std(:,2))
      title('Sinc - Deformation: G1')
      ylim([0 1]);
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

   % figure 
   subplot(2,3,3)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma_std(:,3))
      ylim([0 1]);
      title('Sinc - Deformation: G2')
      xlabel('Extended SSC')
      ylabel('Mean Network Output')

   % figure 
   subplot(2,3,4)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma_std(:,4))
      ylim([0 1]);
      title('Sinc - Deformation: PB1')
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

   % figure
   subplot(2,3,5)
      X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
                       'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
                       'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
      bar(X,SensAuxOutput_deltaSigma_std(:,5))
      ylim([0 1]);
      title('Sinc - Deformation: PB2')
      xlabel('Extended SSC')
      ylabel('Sensiblitity 1/ deltaSigma')

% *//////////////////////////////////////////////////////////////////////////////      
% SensAuxOutputMean = mean(SensAuxOutput_deltaSigma,2);
% figure 
%       X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
%                        'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
%                        'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
%       X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3',...
%                        'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3',...
%                        'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
%       bar(X,SensAuxOutputMean(:,1))
%       title('Sinc - Mean Sensibility')
%       xlabel('Extended SSC')
%       ylabel('Mean')

% *****************************************************************************      
% *****************************************************************************
% % Integral Parameters group
% auxMat = [  SensAuxOutput_deltaSigma(1:10,1),SensAuxOutput_deltaSigma(1:10,2),...
%             SensAuxOutput_deltaSigma(1:10,3),SensAuxOutput_deltaSigma(1:10,4), ...
%             SensAuxOutput_deltaSigma(1:10,5)];
%    X = categorical({'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3'});
%    X = reordercats(X,{'I Mt','I Dt','I Ma','I Da','I Ma1','I Da2','I Da3','I Mt1','I Dt2','I Dt3'});
% figure
%    subplot(3,1,1)
%    h = bar(X,auxMat);
%    set(h, {'DisplayName'}, {'NoDef','Pb1','Pb2','G1','G2'}')
%    legend()
%    
% % -----------------------------------------------------------------
% auxMat = [  SensAuxOutput_deltaSigma(11:20,1),SensAuxOutput_deltaSigma(11:20,2),...
%             SensAuxOutput_deltaSigma(11:20,3),SensAuxOutput_deltaSigma(11:20,4), ...
%             SensAuxOutput_deltaSigma(11:20,5)];
%    X = categorical({'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3'});
%    X = reordercats(X,{'S Mt','S Dt','S Ma','S Da','S Ma1','S Da2','S Da3','S Mt1','S Dt2','S Dt3'});
% % figure
%    subplot(3,1,2)
%    h = bar(X,auxMat);
%    set(h, {'DisplayName'}, {'NoDef','Pb1','Pb2','G1','G2'}')
%    legend()
% % -----------------------------------------------------------------      
% 
% auxMat = [  SensAuxOutput_deltaSigma(21:30,1),SensAuxOutput_deltaSigma(21:30,2),...
%             SensAuxOutput_deltaSigma(21:30,3),SensAuxOutput_deltaSigma(21:30,4), ...
%             SensAuxOutput_deltaSigma(21:30,5)];
%    X = categorical({'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
%    X = reordercats(X,{'D Mt','D Dt','D Ma','D Da','D Ma1','D Da2','D Da3','D Mt1','D Dt2','D Dt3'});
% % figure
%    subplot(3,1,3)
%    h = bar(X,auxMat);
%    set(h, {'DisplayName'}, {'NoDef','Pb1','Pb2','G1','G2'}')
%    legend()  
      