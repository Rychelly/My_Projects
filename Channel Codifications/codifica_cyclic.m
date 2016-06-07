function [codedbits]=codifica_cyclic(mbits,polynom_coeffs)

k=4;
data_coded_c=2;
%  keyboard;
 for indexa=1:k:length(mbits)
    data_coded=fliplr(mbits(indexa:indexa+k-1));
    registers=zeros(1,k); %todos os registros de deslocamento come�am em zero
       for indexb=1:k
           registers=...
               mod((data_coded(indexb)+registers(length(registers))).*polynom_coeffs+registers,2); %aqui que o 
 %circuito � constru�do, alterando os valores da m�quina de estados
           registers=circshift(registers',1)'; %deslocamento
           registers(1)=0; %rejeitando o �ltimo valor
       end
%         keyboard;
       data_coded=[registers(2:end) fliplr(data_coded)];
       data_coded_c=[data_coded_c data_coded];
 end

codedbits=data_coded_c(2:end);

end