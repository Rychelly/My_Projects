function [codedbits]=codifica_hamming(mbits,G)

% keyboard;
 k=4;
 n=7;

 tam=size(G);
 data_coded_c=2;
 tam=size(mbits);
 
 for inda=1:k:length(mbits);
        
    for ind=1:tam(1)
        data_coded(ind,:)=mbits(inda:inda+k-1)*G;
    end
 
    data_coded=mod(data_coded,2);
    data_coded_c=[data_coded_c data_coded];
 end
 codedbits=data_coded_c(2:end);
 
 
 
 end

 


