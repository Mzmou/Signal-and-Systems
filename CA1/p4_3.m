function p4_3(filename,speed)
[audioData, fs] = audioread("Recording (4).m4a");
n=length(audioData);
n_two_times=n/2;
n_half=2*n;
if (speed ~=2 && speed~=0.5)
    disp("not valid")


elseif (speed==2)
new_audio=zeros(1,n_two_times);
for i=1:n_two_times
    new_audio(i)=audioData(2*i);
end
outputFileName = 'output_audio_twotimes.wav'; 
audiowrite(outputFileName, new_audio, fs);
sound(new_audio,fs);
else
    new_audio=zeros(1,n_half);
    new_audio(1)=audioData(1);
    new_audio(n_half)=audioData(n);
    for i=2:n_half-1
        new_audio(i)=(audioData(i-1)+audioData(i+1))/2;
    end
    outputFileName = 'output_audio_half.wav'; 
    audiowrite(outputFileName, new_audio, fs);
    sound(new_audio,fs);         
      


end

