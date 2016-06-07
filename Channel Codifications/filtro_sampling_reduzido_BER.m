clear all;
close all;


%% Parametros iniciais
ind_n=1;
figure;
n=[3];
RS=200e3;% taxa simbolo
Ts =1/RS;
fb=Ts/2;
index=1;
erros=0;
M=4;
frame_size=log2(M).*10e4;
nframes=0;

  for  eb_N0_db=0:8;%0:18;
    nbits=0;
    erros=0;
    total_bits=0;
    nframes=0;
  while erros<100
                            
%% gerando a sequ�ncia aleat�ria
mbits=(round(rand(frame_size,1)))';

%% Aplicar o codigo de canal aqui



%% Modulador




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%acaba o transmissao
%% adicao de ruido
eb_N0=10^(eb_N0_db/10);
N0=eb/eb_N0;
var_noise=OS*N0/2;


Ifilter_n= awgn(Ifilter,eb_N0_db-10*log10(OS/2),'measured') ;
Qfilter_n= awgn(Qfilter,eb_N0_db-10*log10(OS/2),'measured') ;

%plot do sinal no tempo com ruído
% figure; subplot(2,1,1); plot(Ifilter_n(1:20*OS));
% xlabel('n','FontSize',11); ylabel('I','FontSize',11);
% grid on;
% subplot(2,1,2); plot(Qfilter_n(1:20*OS));
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);
% 
% signal_spectre=fftshift(pwelch(Ifilter+j.*Qfilter));
% freq=linspace(-OS/2,OS/2,length(signal_spectre));
% figure;plot(freq,10.*log10(signal_spectre));
% grid on;
% xlabel('f\timesT_s','FontSize',11); ylabel('A_{dB}','FontSize',11);
% set(gca,'FontSize',11);
% 
% noise_spectre=fftshift(pwelch(noise_I+j.*noise_Q));
% freq=linspace(-OS/2,OS/2,length(noise_spectre));
% hold on;plot(freq,10.*log10(noise_spectre),'r');
% grid on;
% % xlabel('f\timesT_s','FontSize',11); ylabel('S(f)_{dB}','FontSize',11);
% legend('Signal','Noise');
% set(gca,'FontSize',11);

% plotar o spectro do sinal e do ruído


%%%%%%%%%%%%%%%%%%%%%%%%%%%%comeca o receptor


%% Aplicacao do filtro casado na recepcao (que é a definicao da correlacao)
yI=conv(ps,Ifilter_n);%correlate I
yQ=conv(ps,Qfilter_n);%correlate Q

% 
% figure; subplot(2,1,1); plot(yI(1:20*OS));
% xlabel('n','FontSize',11); ylabel('I','FontSize',11);
% grid on;
% subplot(2,1,2); plot(yQ(1:20*OS));
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);


%% Downsampling

 zI=yI(round(2*Gd):OS:end);%/(pow(ps)*OS);%downsample
 zQ=yQ(round(2*Gd):OS:end);%/(pow(ps)*OS);%downsample
 
 
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

g = modem.pskdemod(M);  % Create a demodulator object
                       % from a modem.qammod object
                       % and display its properties.
z = demodulate(g,zI+j.*zQ); 


Zbits=de2bi(z);
Zbits=reshape(fliplr(Zbits)',numel(Zbits),1);
% Zbits=reshape([(sign(zI)+1)./2; (sign(zQ)+1)./2],1,2.*length(zQ));
Zbits=Zbits(1:length(mbits))';



% 
% figure; stem(m(1:40));
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);
% 
% hold on; stem(Zbits(1:40),'r');
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);

%% contagem de erros
erros=erros+sum(abs(sign(Zbits-mbits)))
% total_bits=frame_size+total_bits;
% index
% frame_size

%  frame_size=frame_size.*2;
 nframes=nframes+1;
  end
% keyboard;
BER(index)=erros/(frame_size*nframes);%.*nframes);
index=index+1;
frame_size=10e4;
% eb_N0_db_vec(index)=eb_N0_db;
 
% BER_export(ind_n,:)=BER;
%figure;plot(ps);
%ind_n=ind_n+1;
% signal_spectre=pwelch(Zbits);
% figure;plot(signal_spectre);
% 
 end
figure;semilogy([0:8],BER);

