% Initialize cell arrays to store results
rate1Results = {}; % Cell array to store results for rate 1
rate2Results = {}; % Cell array to store results for rate 2
rate3Results = {}; % Cell array to store results for rate 3

for i = 1:20
    sigma = i / 10;
  %  disp(["sigma:", num2str(sigma)]);
    
    % Rate 1
   % disp("rate = 1");
    CodedMessage = coding_amp('signal', 1); 
    CodedMessage = withNoise(CodedMessage, sigma);
    decodedMessage1 = decoding_amp(CodedMessage, 1);
    rate1Results{end+1} = decodedMessage1; % Append to rate1Results
    
    % Rate 2
    %disp("rate = 2");
    CodedMessage = coding_amp('signal', 2);  
    CodedMessage = withNoise(CodedMessage, sigma);
    decodedMessage2 = decoding_amp(CodedMessage, 2);
    rate2Results{end+1} = decodedMessage2; % Append to rate2Results
    
    % Rate 3
   % disp("rate = 3");
    CodedMessage = coding_amp('signal', 3); 
    CodedMessage = withNoise(CodedMessage, sigma);
    decodedMessage3 = decoding_amp(CodedMessage, 3);
    rate3Results{end+1} = decodedMessage3; % Append to rate3Results
end
disp("rate = 1");
disp(rate1Results);
disp("rate = 2");
disp(rate2Results);
disp("rate = 3");
disp(rate3Results);
