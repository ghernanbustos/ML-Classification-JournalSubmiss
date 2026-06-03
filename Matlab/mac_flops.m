
% To access model parameters loads 
load('sinc_exportedTrainedModels_BIS.mat')
load('gauss_exportedTrainedModels_BIS.mat')
load('chirp_exportedTrainedModels_BIS.mat')


% SINC MLP
layers = [30, 202, 5]; % example

total_flops = 0;

for i = 1:length(layers)-1
    n_in = layers(i);
    n_out = layers(i+1);
    flops_layer = 2 * n_in * n_out;
    total_flops = total_flops + flops_layer;
end

fprintf('Total FLOPs: %d\n', total_flops);

% GAUSS MLP
layers = [30, 88, 294, 4, 5]; % example

total_flops = 0;

for i = 1:length(layers)-1
    n_in = layers(i);
    n_out = layers(i+1);
    flops_layer = 2 * n_in * n_out;
    total_flops = total_flops + flops_layer;
end

fprintf('Total FLOPs: %d\n', total_flops);

% CHIRP MLP
layers = [30, 36, 253, 300, 5]; % example

total_flops = 0;

for i = 1:length(layers)-1
    n_in = layers(i);
    n_out = layers(i+1);
    flops_layer = 2 * n_in * n_out;
    total_flops = total_flops + flops_layer;
end

fprintf('Total FLOPs: %d\n', total_flops);