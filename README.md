# Redes Neuronales

Práctica de Redes Neuronales, de la asignatura *Inteligencia Computacional*, del Máster de Ingeniería Informática.

Implementado en MatLab y su *Neural Network Toolbox*.


### MNIST: Reconocimiento óptico de caracteres

El objetivo  es resolver un problema de reconocimiento de patrones utilizando redes neuronales artificiales. En mi caso usaré una [red de feed-forward backpropagation](http://radio.feld.cvut.cz/matlab/toolbox/nnet/newff.html) que logra alrededor del 97.98% de éxito y una versión de Deep Neural Network basada en la de  [Masayuki Tanaka](http://www.mathworks.com/matlabcentral/fileexchange/42853-deep-neural-network), [entrenándola](https://github.com/JCristobal/redes-neuronales-MNIST/blob/master/DeepNeuralNetwork/mnist/mnistbbdbn_JCristobal.mat) y logrando un 98.31% de éxito.

Para probar la red de feed-forward backpropagation sólo hay que ejecutar el contenido de *feed-forward_backpropagation_network/newff_para_mnist*

Y para Deep Neural Network se puede entrenar en *DeepNeuralNetwork/mnist/trainMNIST.m*

o testear los resultados con *DeepNeuralNetwork/mnist/evaluarMNIST.m*








