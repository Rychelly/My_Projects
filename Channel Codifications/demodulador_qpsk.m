function [Zbits]=demodulador_qpsk(Ifilter, Qfilter, mbits, ps, Ifilter_n, Qfilter_n, OS, delay, M)

yI=conv(ps,Ifilter_n);%correlate I
yQ=conv(ps,Qfilter_n);%correlate Q


% figure; subplot(2,1,1); plot(yI(1:200*OS));
% xlabel('n','FontSize',11); ylabel('I','FontSize',11);
% grid on;
% subplot(2,1,2); plot(yQ(1:200*OS));
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);


%% Downsampling

 zI=yI(round(2*delay):OS:end);%/(pow(ps)*OS);%downsample
 zQ=yQ(round(2*delay):OS:end);%/(pow(ps)*OS);%downsample
 
 
%  figure; subplot(2,1,1); stem(I(1:20));
% xlabel('n','FontSize',11); ylabel('I','FontSize',11);
% grid on;
% subplot(2,1,2); stem(Q(1:20));
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);
% 
%  figure; subplot(2,1,1); stem(zI(1:20),'r');
% xlabel('n','FontSize',11); ylabel('I','FontSize',11);
% grid on;
% subplot(2,1,2); stem(zQ(1:20),'r');
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);
% figure;plot(zI(1:10000),zQ(1:10000),'+');
% keyboard;

% figure; subplot(2,1,1);plot(Ifilter(1:1000));
% hold on; plot(yI(1:1000),'r');
% subplot(2,1,2);plot(Qfilter(1:1000));
% hold on; plot(yQ(1:1000),'r');


g = modem.pskdemod('M',M,'SymbolOrder', 'Gray');  % Create a demodulator object
                       % from a modem.qammod object
                       % and display its properties.
z = demodulate(g,2.*zI+2.*j.*zQ); 


Zbits=de2bi(z);
Zbits=reshape(fliplr(Zbits)',numel(Zbits),1);
% Zbits=reshape([(sign(zI)+1)./2; (sign(zQ)+1)./2],1,2.*length(zQ));
Zbits=Zbits(1:length(mbits))';

end