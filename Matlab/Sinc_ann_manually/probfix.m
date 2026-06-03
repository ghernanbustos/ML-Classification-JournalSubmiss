function  labelr = probfix(labelp, valp)
% Elige aleatoriamente entre las etiquetas asignadas con 'labelp' utilizando
% los pesos o valores probabilisticos dados por 'valp'. La etiqueta elegida
% es devuelta como 'labelr'
% La suma de todos los elementos de 'valp' debe ser igual a 1
labelp   = labelp';
valp     = valp'; 
%%%% Dimensión del arreglo de etiquetas y probabilidades
Np = size(labelp,2);
%%%%
%%%% Ordena los valores de probabilidad y sus etiquetas de mayor a menor
for x = 1:Np
    for y = x+1:Np
        if(valp(x) < valp(y))
            valp_aux = valp(x);
            valp(x) = valp(y);
            valp(y) = valp_aux;
            
            labelp_aux = labelp(x);
            labelp(x) = labelp(y);
            labelp(y) = labelp_aux;
        end
    end
end
%%%%

%%%% Elige de manera uniforme un número al azar entre 0 y 1
valp_rnd = rand;
%%%%

%%%% Transforma la distribución de probabilidad uniforme entre 0 y 1
%%%% en una distribución de probabilidades definidas por los valores de 'valp'
%%%% Elige al azar entre las etiquetas usando la nueva distribución
valp_sup = 0;
for x = 1:Np %en nuestro caso 5
    valp_inf = valp_sup;
    valp_sup = valp_inf + valp(x);
    if (valp_rnd >= valp_inf) && (valp_rnd <= valp_sup)
        break;
    end
end
labelr = labelp(x); 
%%%%

