function codedMessage = coding_amp(inputMessage, rate)
    % Initialize the mapping set and binary message array
    mapSet = MapSet();
    binMessage = [];
    messageLength = strlength(inputMessage);
    frequency = 100; % Sample frequency

    % Convert each character in the message to its binary representation
    for charIndex = 1:messageLength
        currentChar = extract(inputMessage, charIndex);
        for mapIndex = 1:32
            % Compare current character with mapset entries
            if strcmp(currentChar, mapSet(1, mapIndex))
                % Append binary representation to binMessage
                binMessage = cat(2, binMessage, mapSet(2, mapIndex));
                break; % Break out of loop once match is found
            end
        end
    end

    % Convert cell array to character array
    binMessage = cell2mat(binMessage);
    binMessageLength = length(binMessage);
    
    % Segment the binary message according to the rate
    segmentIndex = 1;
    for startIdx = 1:rate:binMessageLength
        endIdx = min(startIdx + rate - 1, binMessageLength);
        % Extract segment and store in segmentedMessage
        segmentedMessage{segmentIndex} = binMessage(startIdx:endIdx);
        segmentIndex = segmentIndex + 1;
    end
    binMessage = segmentedMessage;

    % Generate binary representations for encoding
    binaryRepresentation = cell(1, 2^rate);
    decNumbers = 0:(2^rate - 1);
    binNumbers = dec2bin(decNumbers, rate);

    % Store each binary pattern for 0 to 2^rate - 1
    for idx = 1:length(decNumbers)
        binaryRepresentation{idx} = binNumbers(idx, :);
    end

    % Generate encoding coefficients
    encodedCoeffs = linspace(0, 1, 2^rate);

    % Calculate the number of bits needed for encoding
    numSegments = (messageLength * 5) / rate;
    timeSamples = zeros(numSegments, frequency);

    % Define a time vector for each segment
    for idx = 1:numSegments
        timeSamples(idx, :) = linspace(idx - 1, idx, frequency);
    end

    % Encode message based on binary representation
    encodedMessageCoeffs = [];
    for segmentIdx = 1:numSegments
        for binIdx = 1:2^rate
            if strcmp(binMessage{segmentIdx}, binaryRepresentation{binIdx})
                encodedMessageCoeffs = [encodedMessageCoeffs, encodedCoeffs(binIdx)];
                break; % Break once match is found
            end
        end
    end

    % Initialize coded message array and encode with sine waves
    codedMessage = zeros(numSegments, frequency);
    for segmentIdx = 1:numSegments
        codedMessage(segmentIdx, :) = encodedMessageCoeffs(segmentIdx) * sin(2 * pi * timeSamples(segmentIdx, :));
    end

end
