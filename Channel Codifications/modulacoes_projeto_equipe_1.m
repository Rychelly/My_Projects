% PB x Eb/N0
clear all; 
close all; 
clc; 
%r=300Kbps
%b=110KHz
%BER 1E-2
%Px/N0=63,5dB
Eb_N0=0:0.1:15; %gerou o vetor es_n0 em dB
M = [2 4 8 16 32 64]; 
Eb_N0=10.^(Eb_N0./10); %passou o vetor pra linear
fori=1:6 
P_e=2.*qfunc(sqrt(2.*Eb_N0.*log2(M(i))).*sin(pi/M(i))); 
% taxa de erro simbolo PSK
P_b=P_e./log2(M(i)); 
switchi 
case1 
semilogy(10.*log10(Eb_N0),P_b,'r'); % 2-PSK
case2 
semilogy(10.*log10(Eb_N0),P_b,'k');% 4-PSK
case3 
semilogy(10.*log10(Eb_N0),P_b,'g');% 8-PSK
case4 
semilogy(10.*log10(Eb_N0),P_b,'b');% 16-PSK
case5 
semilogy(10.*log10(Eb_N0),P_b,'r-.');% 32-PSK
case6 
semilogy(10.*log10(Eb_N0),P_b,'k--');% 64-PSK
end
legend('2-PSK','4-PSK','8-PSK','16-PSK','32-PSK','64-PSK'); 
hold on; 
end
grid on; 
title('BER modulação M-PSK'); 
xlabel('E_b/N_0 _{(dB)}'); 
ylabel('p_B'); 
clear M; 
M = [2 4 8 16]; 
figure; 
fori=1:4 
P_e=(M(i)-1).*qfunc(sqrt(2.*Eb_N0.*log2(M(i)))); % 
taxa de erro simbolo FSK
P_b=P_e.*((M(i)/2)./(M(i)-1)); 
switchi 
case1 
semilogy(10.*log10(Eb_N0),P_b,'r'); % 2-FSK
case2 
semilogy(10.*log10(Eb_N0),P_b,'k');% 4-FSK
case3 
19 
semilogy(10.*log10(Eb_N0),P_b,'g');% 8-FSK
case4 
semilogy(10.*log10(Eb_N0),P_b,'b');% 16-FSK
end
legend('2-FSK','4-FSK','8-FSK','16-FSK'); 
hold on; 
end
grid on; 
title('BER modulação M-FSK'); 
xlabel('E_b/N_0 _{(dB)}'); 
ylabel('p_B'); 
clear M; 
L = [sqrt(16) sqrt(64) sqrt(256)]; 
figure; 
fori=1:3 
P_b=((2.*(1-(L(i)).^-1))./log2(L(i))).*qfunc(sqrt((3.*log2(L(i))./(L(i).^2-1)).*2.*Eb_N0)); % taxa de erro simbolo QAM
switchi 
case1 
semilogy(10.*log10(Eb_N0),P_b,'r'); % 16-QAM
case2 
semilogy(10.*log10(Eb_N0),P_b,'k');% 64-QAM
case3 
semilogy(10.*log10(Eb_N0),P_b,'g');% 256-QAM
end
legend('16-QAM','64-QAM','256-QAM'); 
hold on; 
end
grid on; 
title('BER modulação M-QAM'); 
xlabel('E_b/N_0 _{(dB)}'); 
ylabel('p_B'); 
grid on; 