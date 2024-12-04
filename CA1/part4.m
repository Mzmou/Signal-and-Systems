
[audioData, fs] = audioread("Recording (4).m4a");
disp(['Sampling Frequency: ', num2str(fs), ' Hz']);

t = (0:length(audioData)-1) / fs;


figure;
plot(t, audioData);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Audio Signal');
grid on;
xlim([0 max(t)]); 

outputFileName = 'output_audio.wav'; 
audiowrite(outputFileName, audioData, fs);

p4_3('Recording (4).m4a', 2);
p4_4('Recording (4).m4a', 0.5);
