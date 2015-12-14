% Cargamos las imágenes y sus etiquetas
images = loadMNISTImages('data/train-images.idx3-ubyte');
labels = loadMNISTLabels('data/train-labels.idx1-ubyte');

%% Cambiamos el formato

targetValues = 0.*ones(10, size(labels, 1));
for n = 1: size(labels, 1)
    targetValues(labels(n) + 1, n) = 1;
end;

%% Realizamos el entrenamiento

% newff  con capas de tamaño 200 y 10 
% funciones de transferencia tansig y logsig
net=newff(minmax(images),[200,10],{'tansig','logsig'});

%net será la red entrenada y tr el error en función de la iteración
net.trainParam.epochs = 200; %programo la red para 200 iteraciones (epochs)
%net.trainParam.showWindow=False; %para ocultar la interfaz gráfica
%net.trainParam.time=600; %tiempo de entreo en segundos
[net,tr]=train(net,images,targetValues, 'useGPU','yes');

fprintf('Entrenamiento de la red finalizado \n ');

%% Cargamos los datos de Test

images_test = loadMNISTImages('data/t10k-images.idx3-ubyte');
labels_test = loadMNISTLabels('data/t10k-labels.idx1-ubyte');

y = net(images_test);


%% Comprobamos los resultados

correct = 0;
for t=1:size(labels_test, 1)
    if(find(y(:,t)==max(y(:,t)))==(labels_test(t)+1))
        correct=correct+1;
    end
end

res = correct/size(labels_test, 1);


fprintf('Porcentaje de exactitud : %.3f %% \n ', res*100);

%% Mostramos los resultados del conjunto de prueba
fprintf('Mostramos los resultados del conjunto de prueba: \n ');
for t=1:size(y, 2)
    valor = find(y(:,t)==max(y(:,t)));
    if(valor == 1)
        fprintf('0');
    else
        fprintf('%.d%', valor-1);
    end
end
fprintf('\n');

%% Generamos un archivo con los resultados del conjunto de prueba

fileID = fopen('resultados.txt','w');

for t=1:size(y, 2)
    valor = find(y(:,t)==max(y(:,t)));
    if(valor == 1)
        fprintf(fileID,'0');
    else
        fprintf(fileID,'%.d%', valor-1);
    end
end

fclose(fileID);

fprintf('\nResultados del conjunto de prueba escritos en el documento resultados.txt\n');

