function [Y_pred] = cnn_computingTime(net, x,y)

clear OSig
OSig = Metodo_ESSC_ANN();

% Sinc data signal
OSig.Carga_Signal(y, x);
esscMat = OSig.Obtiene_ESSC();
% Calc ESSC params
esscMat_Aux = reshape(esscMat,30,1); % Format input data for ANN model.

% Instantiate ESSC calculator
% Y_pred = predict(net,esscMat_Aux') % trasponse input mat
Y_pred = net(esscMat_Aux');

end

