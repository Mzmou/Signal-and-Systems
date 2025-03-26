function coded_message = coding_freq(message, rate)

    Mapset = MapSet;
    binaryMessage = [];
    fs = 100; 
    numChunks = ceil((strlength(message) * 5) / rate);

   
    for charIndex = 1:strlength(message)
        for mapIndex = 1:32
            if strcmp(extract(message, charIndex), Mapset(1, mapIndex))
                binaryMessage = [binaryMessage, Mapset(2, mapIndex)];
            end
        end
    end
    binaryMessage = cell2mat(binaryMessage);


    binaryChunks = mat2cell(binaryMessage, 1, repmat(rate, 1, floor(length(binaryMessage)/rate)));
    if mod(length(binaryMessage), rate) > 0
        binaryChunks{end+1} = binaryMessage(end-mod(length(binaryMessage), rate)+1:end);
    end

   
    freqStep = floor(50 / (2^rate));
    freqArray = ((0:(2^rate-1)) * freqStep) + floor(freqStep / 2);


    binaryRepresentations = arrayfun(@(x) dec2bin(x, rate), 0:(2^rate-1), 'UniformOutput', false);

 
    frequencies = zeros(1, numChunks);
    for chunkIndex = 1:numChunks
        binaryChunk = binaryChunks{chunkIndex};
        matchingIndex = find(strcmp(binaryChunk, binaryRepresentations));
        if ~isempty(matchingIndex)
            frequencies(chunkIndex) = freqArray(matchingIndex);
        end
    end

 
    timeStep = 1 / fs;
    timeVector = 0:timeStep:1-timeStep;
    coded_message = arrayfun(@(freq) sin(2 * pi * freq * timeVector), frequencies, 'UniformOutput', false);
    coded_message = cell2mat(coded_message');

    colors = {'m', 'g', 'b'};
    figure;
    hold on;
    for chunkIndex = 1:numChunks
        timeOffset = (chunkIndex - 1);
        plot(timeVector + timeOffset, coded_message(chunkIndex, :), 'Color', colors{mod(chunkIndex - 1, length(colors)) + 1});
    end
    hold off;

  
    title(['Bit Rate: ', num2str(rate)], 'Interpreter', 'latex');
    xlabel('Time (s)');
    ylabel('Amplitude');
end
