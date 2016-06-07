clear all;
close all;


%% Parametros iniciais
ind_n=1;
figure;
RS=200e3;% taxa simbolo
Ts =1/RS;
fb=Ts/2;
index=1;
erros=0;
M=4;
frame_size=log2(M).*10e3;
OS=10;
nframes=0;

  for  eb_N0_db=0:7;
    nbits=0;
    erros=0;
    erros_un=0;
    total_bits=0;
    nframes=0;
    total_size=0;
  while erros<80 && frame_size<8*log2(M)*10e3
                            
%% gerando a sequï¿½ncia aleatï¿½ria
mbits=(round(rand(frame_size,1)))';

%% Aplicar o codigo de canal aqui
G=[[1 0 1 1]; [1 1 1 1]]; %sequencias geradoras
codedbits=convolutional_coding(mbits,G);    
 

% keyboard;


% keyboard;

%% Modulador
[eb, delay, Ifilter, Qfilter, ps]=modulador_qpsk(codedbits,M, OS);
[eb_un, delay_un, Ifilter_un, Qfilter_un, ps_un]=modulador_qpsk(mbits,M, OS);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%acaba o transmissao
%% adicao de ruido
eb_N0=10^(eb_N0_db/10);
N0=eb/eb_N0;
var_noise=OS*N0/2;

Ifilter_n= awgn(Ifilter,eb_N0_db-10*log10(OS/2),'measured') ;
Qfilter_n= awgn(Qfilter,eb_N0_db-10*log10(OS/2),'measured') ;
% keyboard;

Ifilter_n_un= awgn(Ifilter_un,eb_N0_db-10*log10(OS/2),'measured') ;
Qfilter_n_un= awgn(Qfilter_un,eb_N0_db-10*log10(OS/2),'measured') ;

%plot do sinal no tempo com ruÃ­do
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

% plotar o spectro do sinal e do ruÃ­do

%%%%%%%%%%%%%%%%%%%%%%%%%%%%comeca o receptor

%% Demodulador
[Zbits]=demodulador_qpsk(Ifilter, Qfilter,codedbits, ps, Ifilter_n, Qfilter_n, OS, delay, M);

[Zbits_un]=demodulador_qpsk(Ifilter, Qfilter, mbits, ps, Ifilter_n_un, Qfilter_n_un, OS, delay, M);
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
%% Aplicar o decoficador do canal


G = [1 1 0 1 0 0 0 ; 0 1 1 0 1 0 0; 1 1 1 0 0 1 0; 1 0 1 0 0 0 1];
decodedbits=decodifica_hamming(Zbits,G);
%  keyboard;

%% contagem de erros
erros=erros+sum(abs(sign(decodedbits-mbits)))
erros_un=erros_un+sum(abs(sign(Zbits_un-mbits)))
% total_bits=frame_size+total_bits;
% index
% frame_size
total_size=total_size+frame_size
   frame_size=frame_size.*2;
%  nframes=nframes+1;
  end
% keyboard;
BER(index)=erros/(total_size);%*nframes);%.*nframes);
BER_un(index)=erros_un/(total_size);%*nframes);%.*nframes);

index=index+1;
frame_size=log2(M).*10e3;

% eb_N0_db_vec(index)=eb_N0_db;
 % BER_export(ind_n,:)=BER;
%figure;plot(ps);
%ind_n=ind_n+1;
% signal_spectre=pwelch(Zbits);
% figure;plot(signal_spectre);
% 
  end
  
  
Eb_N0=0:7;
figure;semilogy(Eb_N0,BER);
hold on;semilogy(Eb_N0,BER_un,'g');
%% testar com as curvas teóricas

Eb_N0_lin=10.^(Eb_N0./10); %passou o vetor pra linear

P_e=2.*qfunc(sqrt(2.*Eb_N0_lin.*log2(M)).*sin(pi/M)); 
% taxa de erro simbolo PSK
P_b=P_e./log2(M); 
hold on; semilogy(Eb_N0,P_b,'r');
grid on;legend('Coded','Uncoded','Teórico')

