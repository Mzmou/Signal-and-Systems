function p4_4(filename,speed)

  outputFileName = 'output_audio_extended.wav';
if(((speed*10) <5) || ((speed*10)>20) || (mod(speed*100,10)~=0) )
    disp("not valid")
else  
    [audioData, fs] = audioread(filename);
    
     
         new_sound=resample(audioData,10,speed*10);
         audiowrite(outputFileName, new_sound, fs);
sound(new_sound,fs)  ;       
      
      

     
end    