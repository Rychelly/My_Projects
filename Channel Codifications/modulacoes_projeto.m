clear all;
close all;


Eb_N0=0:0.1:13; %gerou o vetor es_n0 em dB

Eb_N0=10.^(Eb_N0./10); %passou o vetor pra linear

M=4;

P_e=2.*qfunc(sqrt(2.*Eb_N0.*log2(M)).*sin(pi/M));

P_b=P_e./log2(M);


figure;semilogy(10.*log10(Eb_N0),P_b);

grid on;

xlabel('E_b/N_0 _{(dB)}');
ylabel('p_B');


M=4;

P_e=2.*qfunc(sqrt(2.*Eb_N0.*log2(M)).*sin(pi/M));

P_b=P_e./log2(M);


hold on;semilogy(10.*log10(Eb_N0),P_b,'r');

grid on;

xlabel('E_b/N_0 _{(dB)}');
ylabel('p_B');


