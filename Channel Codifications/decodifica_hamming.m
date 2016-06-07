function [decodedbits]=dcodifica_hamming(Zbits,G)


 %% gerando os padroes de erro corrigiveis
 tam=size(G);
 error(1,:)=[zeros(tam(2),1)'];
 error(2,:)=[1 zeros(tam(2)-1,1)']; %gerando o padrão de erros

 for ind=3:tam(2)+1 %gerando o padrão de erros
    error(ind,:)=circshift(error(ind-1,:)',+1)';
 end
 tam_error=size(error);

 

 for ind=1:tam_error(1) 
      sindrome(ind,:)=hamming_sindrome(error(ind,:),G); %calculando a síndrome   %para o padrão de erros
 end

 sind=sindrome;
 
 nk=tam(2)-tam(1);
 
 indd=1;
 data_decodedc=2;
%  keyboard;
 while indd<length(Zbits)     
     sindrome=hamming_sindrome(Zbits(indd:indd+tam(2)-1),G);
     ind_error=find(bi2de(fliplr(sindrome))==bi2de(fliplr(sind)));
     data_sent=mod((error(ind_error,:)+Zbits(indd:indd+tam(2)-1)),2);
     
      
     data_decoded=data_sent(nk+1:length(data_sent));    
     data_decodedc=[data_decodedc data_decoded];
     indd=indd+tam(2);
 end


decodedbits=data_decodedc(2:end);
end




 




 