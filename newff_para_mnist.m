% Cargamos las im�genes y sus etiquetas
images = loadMNISTImages('data/train-images.idx3-ubyte');
labels = loadMNISTLabels('data/train-labels.idx1-ubyte');

%% Cambiamos el formato

targetValues = 0.*ones(10, size(labels, 1));
for n = 1: size(labels, 1)
    targetValues(labels(n) + 1, n) = 1;
end;

%% Realizamos el entrenamiento

% newff  con capas de tama�o 200 y 10 
% funciones de transferencia tansig y logsig
net=newff(minmax(images),[200,10],{'tansig','logsig'});

%net ser� la red entrenada y tr el error en funci�n de la iteraci�n
net.trainParam.epochs = 200; %programo la red para 200 iteraciones (epochs)
%net.trainParam.showWindow=False; %para ocultar la interfaz gr�fica
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
