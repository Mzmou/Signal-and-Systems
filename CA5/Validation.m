

message1 = coding_freq('signal', 1); 
message2 = coding_freq('signal', 5);

decoded2 = decoding_freq(message2, 5);  
decoded1 = decoding_freq(message1, 1);
for i=1:20
message1 = withNoise(message1, i/10);    
message2 = withNoise(message2, i/10);    
decoded2 = decoding_freq(message2, 5);  
decoded1 = decoding_freq(message1, 1);
disp(i/10);
disp(['Decoded message for rate 1: ', decoded1]);
disp(['Decoded message for rate 5: ', decoded2]);

end




function noisyMessage = withNoise(message, noiseLevel)
  
 

    noise = noiseLevel * randn(size(message));
    noisyMessage = message + noise;  
end
