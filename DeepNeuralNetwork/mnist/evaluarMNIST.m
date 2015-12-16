
clear all;
addpath('..');

mnistfiles = 0;
if( exist('../../data/t10k-images.idx3-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end
if( exist('../../data/t10k-labels.idx1-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end
if( exist('../../data/train-images.idx3-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end
if( exist('../../data/train-labels.idx1-ubyte', 'file') == 2 )
    mnistfiles = mnistfiles + 1;
end

if( mnistfiles < 4 )
    warning('Can not find mnist data files. Please download four data files from http://yann.lecun.com/exdb/mnist/ . Unzip and copy them to same folder as testMNIST.m');
    return;
end

%Cargamos los datos y los tranformamos
[TrainImages TrainLabels TestImages TestLabels] = mnistread();

%load mnistbbdbn; % trained by Masayuki Tanaka
load mnistbbdbn_JCristobal; 

rmse= CalcRmse(bbdbn, TrainImages, TrainLabels);
ErrorRate= CalcErrorRate(bbdbn, TrainImages, TrainLabels,0);
fprintf( 'Para el conjunto de entrenamiento::\n' );
fprintf( '  rmse: %g\n', rmse );
fprintf( '  Tasa de error: %g\n', ErrorRate );

rmse= CalcRmse(bbdbn, TestImages, TestLabels);
ErrorRate= CalcErrorRate(bbdbn, TestImages, TestLabels,1);
fprintf( 'Para el conjunto de prueba:\n' );
fprintf( '  rmse: %g\n', rmse );
fprintf( '  Tasa de error: %g\n', ErrorRate );

