function decodedMessage = decoding(picture, mapSet, threshold)
    % Initialize the binary message string
    binMessage = '';
    
    % Extract the LSB from each pixel in the picture
    for i = 1:numel(picture)
        pixelBinary = dec2bin(picture(i), 8);  % Ensure an 8-bit binary representation
        lsb = pixelBinary(end);  % Get the least significant bit
        binMessage = [binMessage, lsb];  % Append LSB to the binary message
    end
    
    % Initialize the decoded message
    decodedMessage = '';
    
    % Decode the binary message in chunks
    while length(binMessage) >= threshold
        % Extract the first 5 bits for character decoding
        binChar = binMessage(1:5);
        binMessage = binMessage(6:end);  % Remove the processed bits
        
        % Find the corresponding character in the mapSet
        wordIndex = find(strcmp(binChar, mapSet(2, :)), 1);  % Return the first match
        if isempty(wordIndex)
            error('Error in Decoding: Binary segment not found in mapSet.');
        end
        
        char = mapSet{1, wordIndex};
        
        % Check for termination character
        if char == ';'
            decodedMessage = [decodedMessage, char];
            break;
        end
        
        % Append decoded character to the message
        decodedMessage = [decodedMessage, char];
    end
    
    % Display the decoded message
    disp(decodedMessage);
end
