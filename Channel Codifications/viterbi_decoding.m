function [data_decoded]=viterbi_decoding(data_coded,trellis)
 
 
clear state
clear state1
clear dist
state(1)=0;
data_decoded(1)=2;
dist(1)=0;
ind=1;
ind2=1;
 
column=1;
for ind=1:2:length(data_coded)
        
    for ind2=1:length(state)
        var=(((trellis.state1(:,state(ind2)+1,1))'));
       vari=var(3)*1+var(2)*2+var(1)*4;     
       state1(column,2*(ind2-1)+1)=vari;
       
       var=((trellis.state1(:,state(ind2)+1,2))');
       vari=var(3)*1+var(2)*2+var(1)*4;
       state1(column,2*(ind2-1)+2)=vari;    
             
       
       dist(column,2*(ind2-1)+1)=sum(abs([data_coded(ind) data_coded(ind+1)]-trellis.output(:,state(ind2)+1,1)'));
       dist(column,2*(ind2-1)+2)=sum(abs([data_coded(ind) data_coded(ind+1)]-trellis.output(:,state(ind2)+1,2)'));
        
          
        dist_cum(column,2*(ind2-1)+1)= dist(column,2*(ind2-1)+1);
        dist_cum(column,2*(ind2-1)+2)= dist(column,2*(ind2-1)+2);
 
       if ind>1
           
           dist_cum(column,2*(ind2-1)+1)=dist(column,2*(ind2-1)+1)+dist_cum(column-1,(2*(ind2-1)+2)/2);
           dist_cum(column,2*(ind2-1)+2)=dist(column,2*(ind2-1)+2)+dist_cum(column-1,(2*(ind2-1)+2)/2);
           
           
           
       end
 
       
       
    end
    
       if length(state1)>8
 
           if column>4
                for ins=16:-1:1
 
                              state1(1:column-1,ins)=state1(1:column-1,ceil(ins/2));
 
                 end
           else
               for ins=16:-1:1
                   pow=1;
                    for indi=column:-1:2
                             state1(indi-1,ins)=state1(indi-1,ceil(ins/2^pow));
                             pow=pow+1;
                    end
                end
           end
                      
           
           for inds=0:7
 
               ends=find(state1(column,:)==inds);
           
               tt=([dist_cum(column,ends(1)) dist_cum(column,ends(2))]);
               ende=find(tt==min(tt));
               
               if length(ende)~=1
                   ende=ende(1);
               end
 
               dist_new(:,min(ends))=dist(:,ends(ende));
               dist_cum_new(:,min(ends))=dist_cum(:,ends(ende));
               state1_new(:,min(ends))=state1(:,ends(ende));
               
           end
 
               clear state1 dist dist_cum;
               state1=state1_new;
               dist=dist_new;
               dist_cum=dist_cum_new;
               clear state1_new dist_cum_new dist_new;
      
       end
   
    state=state1(column,:);
     column=column+1;
 
end
 
 
 index=find(state1(column-1,:)==min(state1(column-1,:)));
 
 
 data_decoded(1)=2;
 state_seq=[0 state1(:,index)'];
 
 for outindex=2:column
     
       for test=1:2
           var=((trellis.state1(:,state_seq(outindex-1)+1,test))');
           vari=var(3)+var(2)*2+var(1)*4;
           if state_seq(outindex)==vari
               data_decoded(outindex)=test-1;
           end
       end
     
 end
 
 
end
