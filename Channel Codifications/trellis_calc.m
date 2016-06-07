function [trellis]=trellis_calc(k,G)
 
tam_G=size(G);
 
registers=fliplr(de2bi(0:2^(tam_G(2)-1)-1));
 
for register=0:2^(tam_G(2)-1)-1
 
for inputs=0:2^k-1
    
    input_bits=fliplr(de2bi(inputs));
    
    regist_state=fliplr(de2bi(register));
    
 
    trellis.output(1,register+1,inputs+1)=[mod(sum(G(1,:).*[input_bits(1) fliplr(de2bi(register,tam_G(2)-1))]),2)];
%     keyboard;
    for outs=2:tam_G(1)
    trellis.output(outs,register+1,inputs+1)=[mod(sum(G(outs,:).*[input_bits(1) fliplr(de2bi(register,tam_G(2)-1))]),2)];
    end
    
   reg= circshift([input_bits(1) fliplr(de2bi(register,tam_G(2)-1))]',1)';
    
    trellis.state1(:,register+1,inputs+1)=reg(2:end);  % fliplr(de2bi(register,tam_G(2)-1))
       
 
end
 
end
 
 
end
