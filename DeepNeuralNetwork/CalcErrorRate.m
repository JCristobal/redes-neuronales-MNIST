% CalcErrorRate: calculate error rate
%
% ErrorRate = CalcErrorRate( dbn, IN, OUT )
%
%
%Output parameters:
% ErrorRate: error rate
%
%
%Input parameters:
% dbn: network
% IN: input data, where # of row is # of data and # of col is # of input features
% OUT: output data, where # of row is # of data and # of col is # of output labels
% aux: to write in 'resultados.txt' the results of the test data (if aux = 1)
%
%Version: 20131213

% Modified by JCristobal https://github.com/JCristobal/redes-neuronales-MNIST
% Date: 16/12/2015

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deep Neural Network:                                     %
%                                                          %
% Copyright (C) 2013 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ErrorRate = CalcErrorRate( dbn, IN, OUT ,aux)
 out = v2h( dbn, IN );
 [m ind] = max(out,[],2);
 out = zeros(size(out));
 if(aux==1)
     fileID = fopen('resultados.txt','w'); %para almacenar los resultados (abrimos fichero)
     for i=1:size(out,1)
      if(ind(i) == 1)                      %para almacenar los resultados (escribimos en el fichero)
        fprintf(fileID,'0');
      else
        fprintf(fileID,'%.d%', ind(i)-1);
      end
     end
     fclose(fileID);                       %para almacenar los resultados (cerramos fichero)
     fprintf('(Resultados del conjunto de prueba escritos en el documento resultados.txt)\n');
 end

 for i=1:size(out,1)
  out(i,ind(i))=1;
 end


 ErrorRate = abs(OUT-out);
 ErrorRate = mean(sum(ErrorRate,2)/2);

end

