sigma=0.1;
disp("rate = 1");
CodedMessage=coding_amp('signal',1); 
CodedMessage=withNoise(CodedMessage,sigma);
decoding_amp(CodedMessage, 1);
disp("rate = 2");
CodedMessage=coding_amp('signal',2);  
CodedMessage=withNoise(CodedMessage,sigma);
decoding_amp(CodedMessage, 2);
disp("rate = 3");
CodedMessage=coding_amp('signal',3); 
CodedMessage=withNoise(CodedMessage,sigma);
decoding_amp(CodedMessage, 3);




