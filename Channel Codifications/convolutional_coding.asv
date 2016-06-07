function [codedbits]=convolutional_coding(mbits,G)
 
k=1;
tam_G=size(G);
trelliss=trellis_calc(k,G);

mbits=[mbits zeros(tam_G(2)-1,1)']; %for the last input bit to be on the last memory block
state=0;
data_coded_c=2;
   keyboard;
for ind=1:length(mbits)        
    data_coded_c=[data_coded_c trelliss.output(:,state+1,mbits(ind)+1)'];
    var=((trelliss.state1(:,state+1,mbits(ind)+1))');
    vari=var(3)*2^0+var(2)*2^1+var(1)*2^2;
    state=vari;
end
 
 codedbits=data_coded_c(2:end);
end
