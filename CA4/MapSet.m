function mapSet = MapSet()
    mapSet = cell(2, 32);            % Preallocate a 2x32 cell array
    chars = 'abcdefghijklmnopqrstuvwxyz .,!";'; % Define the character set
    numBits = 5;                      % Define the number of bits for binary conversion
    
    for idx = 1:numel(chars)
        mapSet{1, idx} = chars(idx);            % Assign character to the first row
        mapSet{2, idx} = dec2bin(idx - 1, numBits); % Convert index to binary string in the second row
    end
end
