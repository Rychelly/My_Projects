 function [data_coded]=cyclic_coding(data_gen,polynom_coeffs,k)
 
 polynom_size=length(polynom_coeffs);
 indexc=1;
 data_gen=fliplr(data_gen); %no registro de deslocamento os dados são lidos da esquerda para a direita

 for indexa=1:k:length(data_gen)
 	data_coded(indexc+polynom_size-1:indexc-1+polynom_size+k-1)=fliplr(data_gen(indexa:indexa+k-1));
    registers=zeros(1,polynom_size); %todos os registros de deslocamento começam em zero
       for indexb=1:k
           registers=mod((data_gen(indexa+indexb- 1)+registers(length(registers))).*polynom_coeffs+registers,2); %aqui que o 
 %circuito é construído, alterando os valores da máquina de estados
           registers=circshift(registers',1)'; %deslocamento
           registers(1)=0; %rejeitando o último valor
       end

        data_coded(indexc:indexc+polynom_size-2)=registers(2:end);
       
      indexc=indexc+polynom_size+k-1;
 end

 end
