% Initialize system parameters
Fs = 1000;
Rs = 100;
nSamps = Fs/Rs;
rolloff = 0.5;
M = 4;
hMod = comm.PAMModulator; % comm.QPSKModulator System object

% Square root raised cosine filters. Apply gain to normalize passband
% filter gain to unity.
hTxFlt = comm.RaisedCosineTransmitFilter('RolloffFactor', rolloff, ...
    'OutputSamplesPerSymbol', nSamps, ...
    'FilterSpanInSymbols', 6, ...
    'Gain', 9.9121);
hRxFlt = comm.RaisedCosineReceiveFilter('RolloffFactor', rolloff, ...
    'InputSamplesPerSymbol', nSamps, ...
    'FilterSpanInSymbols', 6, ...
    'DecimationFactor', 1, ...
    'Gain', 0.1009);


% Generate modulated and pulse shaped signal
frameLen = 1000;
msgData = randi([0 M-1],frameLen,1);
msgSymbols = step(hMod, msgData);
msgTx = step(hTxFlt, msgSymbols);

t = 0:1/Fs:50/Rs-1/Fs; 
idx = round(t*Fs+1);
hFig = figure; 
plot(t, real(msgTx(idx)));
title('Modulated, filtered in-phase signal');
xlabel('Time (sec)');
ylabel('Amplitude');
grid on;

% Manage the figures
managescattereyefig(hFig);

% Create an eye diagram object
eyeObj = commscope.eyediagram(...
    'SamplingFrequency', Fs, ...
    'SamplesPerSymbol', nSamps, ...
    'OperationMode', 'Complex Signal');

% Update the eye diagram object with the transmitted signal
update(eyeObj, 0.5*msgTx);

% Manage the figures
managescattereyefig(hFig, eyeObj, 'right');