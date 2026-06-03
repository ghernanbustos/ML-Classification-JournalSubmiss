function [CM_prom_round] = CM_func_average(maxNumCM, probfixLabels,numCat,TargetMat,predictedOutputs)
%Promedia entre varias matrices de confusion siendo que a cada una se les aplica
% la funcion probfix la cual genera cierta dispersión en los valores resultados
% de la clasificación de la red neuronal.
% RECIBE:
%  predictedOutputs := Matriz con las Predicciones resultado de la red neuronal.
%  TargetMat        := Matriz con las etiquetas One Hot que luego es re
%                       etiquetada en la funcion para renombrar el 1 por la
%                       posicion correspondiente.
%  maxNumCM         := Cantidad de CM que se desean promediar.
%  numCat           := Cant de categorias 
%  probfixLabels    := Lista de etiquetas en formato columna para la func
%                       probfix
% DEVUELVE:
%  CM_prom_round    := Matriz resultado del promediado de varias de ellas con la
%                      funcion probfix en la asignación de etiquetas
%  
% 
%  Ejemplo de codigo:
%     MC_prom_Num = 50;   
%     probfixLabels = [1;2;3;4;5;6];
%     numCat = size(numLabels,2);
%     nameLabels = {'AT_100%' 'AT_75%' 'AT_50%' 'AT_25%' 'No_AT' 'No_Corresp'};
%     numLabels = [1 2 3 4 5 6];
%     Catlabels = categorical(numLabels,[1 2 3 4 5 6],nameLabels);
%     %Falta mandar la lista de labelsss numLabels
%        C = CM_func_average(MC_prom_Num,,probfixLabels;numCat,TrueLabel,predictedOutputs);
%     figure
%        confusionchart(C,Catlabels);    

% ------------------------------------------------------------------------------
 
% Declarar variables a utilizar
   labeledPredictedOutputs    = zeros(size(predictedOutputs,1), size(predictedOutputs,2));
   auxLabelTargetMat          = zeros(1,size(predictedOutputs,2));   % dim = 1x5000
   auxLabelPredictedOutputs   = zeros(1,size(predictedOutputs,2));   % dim = 1x5000
   CM_acum                    = zeros(numCat,numCat);
   dataAux = zeros(1,1);
%    probfixLabels = [1;2;3;4;5;6]; % En formato columna como esta en el dataset

% Catlabels = categorical(numLabels,[1 2 3 4 5 6],nameLabels)
   
%  STEP #1 Sumatoria de Matrices (Los val de diag Princ, se ignoran)
%-------------------------------------------------------------------------------
for iMC = 1: maxNumCM
%    Reescribe la matriz PREDICCION segun probfix
   for iLabel = 1 : size(predictedOutputs,2)
      % probfix me devuelve un numero correspondiente a la etiqueta elegida
      % entre los valores del argumento labelp, cuyas etiquetas son numeros tambien,
      % en este caso probfixLabels.
      dataAux = probfix(probfixLabels,predictedOutputs(:,iLabel));
      %Reescribe la matriz predicción con el criterio de probfix. Asigna la
      %etiqueta 1,2...5 en la posición correspondiente sobre el elmento columna
      %de la matriz labeledPredictedOutputs. dataAux es la etiqueta asignada y coincide
      %con la posicion de la misma.
      labeledPredictedOutputs(dataAux, iLabel) = dataAux; 
   end
   
   % Reescribe la matriz Target, etiquetas asignadas por nosotros
   % La matriz TargetMat contiene un '1' en la posición correcta de la etiqueta
   % el siguiente 'for' renombra con 1,2...4,5 en la posicion que se encuentre
   % el '1', da una matriz 1x5000
   for iLabel = 1 : size(predictedOutputs,2)
      auxLabelTargetMat(1 , iLabel) = find( TargetMat(:,iLabel) == 1 );
   end
   
%  Toma la matriz labeledPredictedOutputs y la transforma en 1x5000 de igual
%  dimensión que auxLabelTargetMat
   for iLabel = 1 : size(predictedOutputs,2)
      [maxVal, maxPos] = max(labeledPredictedOutputs(:,iLabel));% Toma el valor max y la pos.
      auxLabelPredictedOutputs(1 , iLabel) = maxPos;
   end
   
% - GENERO LA MATRIZ DE CONFUSION -------------------------------
% Las variables argumentos son de igual dimension y criterio de etiquetado, en
% este caso del 1...al 5
   CM = confusionmat(auxLabelTargetMat,auxLabelPredictedOutputs);
%-------------------------------------------------------------------------------   
   CM_acum = CM + CM_acum;
end
%Valor Promedio, para el caso de una iteracion la funcion round no afecta los
%valores de la matriz de confusion
CM_prom_round = round( CM_acum ./ maxNumCM);

%  STEP #2 Re-asgino los valores en la diagonal
%-------------------------------------------------------------------------------
% Trabajamos sobre la matriz CM_prom_round
   deltaElements           = zeros(size(CM_prom_round,2),1);
   CM_prom_round_RawSumMat = sum(CM_prom_round,2);
   CM_prom_round_Diag      = diag(CM_prom_round);
% Reescribo los elem diagonales
for iDiag = 1: size(CM_prom_round,2)
   deltaElements(iDiag,1)= CM_prom_round_RawSumMat(iDiag,1) - CM_prom_round_Diag(iDiag,1);
   CM_prom_round(iDiag,iDiag) = 1000 - deltaElements(iDiag,1);
end 



end

