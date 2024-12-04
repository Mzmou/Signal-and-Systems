function codedImage = coding(message, image, mapset)
    % Check if the message can fit into the image
    if length(message) > numel(image)
        error('Error in Encoding: Message is too large to encode in the given image.');
    end
    
    % Convert each character in the message to its binary representation using the mapset
    messageBinary = cell(1, length(message));
    for i = 1:length(message)
        currentChar = message(i);
        % Find the binary representation for the current character in the mapset
        charIndex = strcmp(currentChar, mapset(1, :));  
        if ~any(charIndex)
            error('Error: Character not found in mapset.');
        end
        messageBinary{i} = mapset{2, charIndex};  % Store the binary representation
    end
    
    % Concatenate the binary representation of the entire message
    codedBinaryMessage = strcat(messageBinary{:});
    
    % Make a copy of the image to embed the message
    codedImage = image;
    
    % Embed each bit of the binary message into the least significant bit of the image pixels
    for i = 1:length(codedBinaryMessage)
        % Get the current pixel value and convert to binary
        pixelValue = codedImage(i);
        pixelBinary = dec2bin(pixelValue, 8);  % Ensure 8-bit representation for consistency
        
        % Replace the least significant bit with the current message bit
        pixelBinary(end) = codedBinaryMessage(i);
        
        % Convert binary string back to decimal and store in the coded image
        codedImage(i) = bin2dec(pixelBinary);
    end
end
