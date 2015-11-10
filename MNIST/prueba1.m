% Cargamos las imágenes y sus etiquetas
images = loadMNISTImages('data/train-images.idx3-ubyte');
labels = loadMNISTLabels('data/train-labels.idx1-ubyte');

%% Cambiamos su formato (a horizontal y a binario)

input = images;
T = reshape(labels,1, length(labels));
T = dec2bin(T);

%% Cada número binario ocupa varias filas hacia abajo

for i=1:size(T,1)
    for j=1:size(T,2)
        aux(j,i) = str2num(T(i,j));
    end
end

T = aux;

%% Realizamos el entrenamiento

% newff para unared de neuronas feedforward, con capas de tamaño 20 y 4 y
% funciones de transferencia tansig y logsig, respectívamente
net=newff(minmax(input),[20,4],{'tansig','logsig'});

%net será la red entrenada y tr el error en función de la iteración
[net,tr]=train(net,input,T, 'useGPU','yes');

%% Cargamos los datos de Test

images_test = loadMNISTImages('data/t10k-images.idx3-ubyte');
labels_test = loadMNISTLabels('data/t10k-labels.idx1-ubyte');

y = net(images_test);

%% Redondeamos y cambiamos formato
y = round(y);
y = reshape(y, length(y), 1);

%%

T2 = reshape(labels_test,1, length(labels_test));
T2 = dec2bin(T2);

for i=1:size(T2,1)
    for j=1:size(T2,2)
        aux2(j,i) = str2num(T2(i,j));
    end
end

%% Resultados

res = eq(aux2, y);
result_perc = sum(res(:))/(size(aux2,1)*size(aux2,2));
error0 = result_perc*100;
display(error0)

%% Calculamos el error cuadratico medio y con ello evaluamos la precision de la red de neuronas.

error = mse(aux2 - y)