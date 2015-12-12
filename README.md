# Redes Neuronales

Práctica de Redes Neuronales, de la asignatura *Inteligencia Computacional*, del Máster de Ingeniería Informática.


### MNIST: Reconocimiento óptico de caracteres

El objetivo  es resolver un problema de reconocimiento de patrones utilizando redes neuronales artificiales. En mi caso usaré una [red de feed-forward backpropagation](http://radio.feld.cvut.cz/matlab/toolbox/nnet/newff.html) que logra alrededor del 97.5% de éxito tras 200 iteraciones (~15 minutos de entreno).

La funcionalidad principal la puedes encontrar en el documento **newff_para_mnist.m**, mientras que *loadMNISTImages.m* y *loadMNISTLabes.m* cargan las imágenes y sus respectivas etiquetas del directorio data/

Implementado en MatLab con la bibliotecas de *Neural Network Toolbox*

![entrenamiento de 200 iteraciones, 96.45%exito entreno y resultado final 97.750%exito](http://i.imgur.com/2CJgYTS.png)


