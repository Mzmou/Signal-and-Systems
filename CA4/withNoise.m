function noisyMessage = withNoise(codedMessage, sigma)
    % Determine the size of the coded message
    [numSegments, numSamples] = size(codedMessage);
    fs = 100;  % Sampling frequency

    % Generate Gaussian noise with mean 0 and standard deviation sigma
    noise = sigma * randn(numSegments, numSamples);

    % Add noise to the coded message
    noisyMessage = codedMessage + noise;

    % Generate a time matrix for plotting
    %time = linspace(0, numSegments, numSegments * fs);
    %time = reshape(time, numSegments, fs);

    % Plot each row of the noisy message against time
   % figure();
    %hold on;
    %for segmentIdx = 1:numSegments
     %   plot(time(segmentIdx, :), noisyMessage(segmentIdx, :), 'r');
    %end
    %title('Noisy Message');
    %xlabel('Time');
    %ylabel('Amplitude');
    %hold off;
end
