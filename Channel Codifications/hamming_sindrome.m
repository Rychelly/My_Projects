 function [sindrome]=hamming_sindrome(insig,G)

 %% calculando a matriz verificadora de paridade
 tam=size(G);
 nk=tam(2)-tam(1);
 p=G(1:tam(1),1:nk);
 H=[eye(nk) p'];
 Ht=H'; %verificadora de paridade transposta
 %% cálculo da síndrome
 sindrome=[0 0 0];
 for ind=1:length(insig)
 	sindrome=mod(sindrome+insig(ind).*Ht(ind,:),2);
 end
 end
