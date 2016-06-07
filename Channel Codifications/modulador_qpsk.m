function [eb, delay, Ifilter, Qfilter, ps]=modulador_qpsk(mbits,M, OS)


m_symb=reshape(mbits,log2(M),length(mbits)/log2(M));
size_m_symb=size(m_symb);
m_symb=2.^(size_m_symb(1)-1:-1:0)*m_symb;

% (round((M-1)*rand(frame_size,1)))'; %gerando a sequencia aleatoria de bits
MSg = m_symb;
n=1;

h = modem.pskmod('M',M,'SymbolOrder', 'Gray');
% h.disp;
y = modulate(h, MSg);
I=real(y);
Q=imag(y);

% figure; subplot(2,1,1); stem(I(1:20));
% xlabel('n','FontSize',11); ylabel('I','FontSize',11);
% grid on;
% subplot(2,1,2); stem(Q(1:20));
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);
 
% figure;plot(I(1:10000),Q(1:10000),'+');
%% Interpolando o sinal para ter 10 amostras por sï¿½mbolo
%  OS=10; % oversampling
 Iup=zeros(1,length(I)*OS);
 Iup(1:OS:end)=I;%oversample mup R mup Im reshape
 Qup=zeros(1,length(I)*OS);
 Qup(1:OS:end)=Q;%oversample mup R mup Im

% figure; subplot(2,1,1); plot(Iup(1:20*OS));
% xlabel('n','FontSize',11); ylabel('I','FontSize',11);
% grid on;
% subplot(2,1,2); plot(Qup(1:20*OS));
% xlabel('n','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);


%% Colocando um filtro de forma nos sï¿½mbolos
ps = (rcosine(1,OS)).^2;%raiz quadrada o número OS do filtro tem de ser o número M da interpolação.
ps_spectre=fft(ps);
ps=ifft(abs(ps_spectre).^.5.*exp(1i.*phase(ps_spectre))); 
[ind1 ind_ps]=size(ps);
ps=ps(OS/2*(n-1)+1:ind_ps-OS/2*(n-1)); %o corte do filtro depende do M, aqui o 5 era M/2 

% ps=[1 1];
% figure;plot(ps);

%% fitlragem / forma do pulso em banda base
%filter R e IM
Ifilter=conv(ps,Iup);%convolve pulse shape with data
Qfilter=conv(ps,Qup);


% figure;
% signal_spectre=fftshift(pwelch(Ifilter+j.*Qfilter));
% freq=linspace(-OS/2,OS/2,length(signal_spectre));
% hold on;plot(freq,10.*log10(signal_spectre));
% grid on;
% xlabel('f\timesT_s','FontSize',11); ylabel('A_{dB}','FontSize',11);
% set(gca,'FontSize',11);

[Gd,W] = grpdelay(ps);% encontrar o delay de grupo do filtro banda base para para plotar a constelacao
delay=max(Gd);
% keyboard;
% figure; plot(Ifilter(round(delay):OS:100*OS),Qfilter(round(delay):OS:100*OS),'+','MarkerSize',4);
% xlabel('I','FontSize',11); ylabel('Q','FontSize',11);
% grid on;
% set(gca,'FontSize',11);
 

eb=sum(Ifilter.^2)/length(I); %Ã© a energia do pulso de hamming

end