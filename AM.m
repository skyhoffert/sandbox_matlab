% Sky Hoffert
% August 22, 2019
% Amplitude Modulation sandbox.

clear,clc

fCarrier = 10e6; % 10 MHz
fSampling = 44.1e3; % CD sampling frequency 44.1 kHz
fAudioStart = 3e3; % assume 3-6 kHz sine wave audio
fAudioEnd = 6e3;
aAudio = 1.0;
pNoise = -30;

nSamples = 10e3;

audioSignal = zeros(nSamples,1);
noiseSignal = wgn(1,nSamples,pNoise);

frequencies = fAudioStart:(fAudioEnd-fAudioStart)/nSamples:fAudioEnd;
phase = 0;

for i = 1:1:nSamples
    audioSignal(i) = aAudio * sin(2*pi*frequencies(i) * (i/fSampling) + phase) + noiseSignal(i);
end

time = 0:1/fSampling:(nSamples-1)/fSampling;

soundsc(audioSignal);

subplot(2,1,1);
plot(time, audioSignal);
ylim([-2*aAudio,2*aAudio]);

subplot(2,1,2);
plot(time, real(fft(audioSignal)));
