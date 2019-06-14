matFile=load('Q4.mat');
y=getfield(matFile,'X');
fs=getfield(matFile,'Fs');
figure,plot(abs(fft(y)));
y=lowpass(y,800,fs);
figure,plot(abs(fft(y)));
%sound(y,fs);
