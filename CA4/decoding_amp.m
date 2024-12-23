function decodedMessage = decoding_amp(codedMessage, rate)
    % Retrieve the MapSet and initialize variables
    mapSet = MapSet();
    correlation = [];
    [numSegments, ~] = size(codedMessage);
    frequency = 100;
    timeAxis = zeros(numSegments, frequency);

    % Generate time axis for each segment
    for idx = 1:numSegments
        timeAxis(idx, :) = linspace(idx - 1, idx, frequency);
    end

    % Calculate correlation with sine wave for each segment
    for idx = 1:numSegments
        sineCorr = 0.01 * sum(2 * sin(2 * pi * timeAxis(idx, :)) .* codedMessage(idx, :));
        correlation = [correlation, double(sineCorr)];
    end

    % Set up encoded coefficients and midpoints
    encodedCoeffs = linspace(0, 1, 2^rate);
    midValues = zeros(1, 2^rate - 1);
    for idx = 1:2^rate - 1
        midValues(idx) = (encodedCoeffs(idx + 1) - encodedCoeffs(idx)) / 2 + encodedCoeffs(idx);
    end

    % Generate binary representations for each encoding level
    binaryRep = cell(1, 2^rate);
    for i = 0:2^rate - 1
        binaryRep{i + 1} = dec2bin(i, rate);
    end

    % Determine binary values from correlation values
    selectedValues = [];
    for corrIdx = 1:numSegments
        for valueIdx = 1:2^rate - 1
            if abs(correlation(corrIdx)) > midValues(valueIdx) && abs(correlation(corrIdx)) <= encodedCoeffs(valueIdx + 1)
                selectedValues = [selectedValues, binaryRep(valueIdx + 1)];
            elseif abs(correlation(corrIdx)) < midValues(valueIdx) && abs(correlation(corrIdx)) >= encodedCoeffs(valueIdx)
                selectedValues = [selectedValues, binaryRep(valueIdx)];
            elseif abs(correlation(corrIdx)) > 1
                selectedValues = [selectedValues, binaryRep(2^rate)];
            end
        end
    end

    % Convert selected values to a character array and segment them
    selectedValues = cell2mat(selectedValues);
    stringLength = length(selectedValues);
    segmentCount = 1;
    segmentedValues = cell(1, ceil(stringLength / 5));
    
    for startIdx = 1:5:stringLength
        endIdx = min(startIdx + 4, stringLength);
        segmentedValues{segmentCount} = selectedValues(startIdx:endIdx);
        segmentCount = segmentCount + 1;
    end

    % Decode each segment by mapping binary codes to characters
    decodedMessage = {};
    mapSetLength = size(mapSet, 2);
    expectedMsgLength = numSegments * rate / 5;

    for segIdx = 1:expectedMsgLength
        for mapIdx = 1:mapSetLength
            if strcmp(segmentedValues{segIdx}, mapSet{2, mapIdx})
                decodedMessage{end + 1} = mapSet{1, mapIdx};
                break; % Exit inner loop once a match is found
            end
        end
    end

    % Convert cell array to string and display
    decodedMessage = strjoin(decodedMessage, '');
   disp(decodedMessage);
end
