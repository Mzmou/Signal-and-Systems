function decodedMessage = decoding_freq(codedmessage, rate)

   binary_num = 2^rate;
   binary_num = arrayfun(@(x) dec2bin(x, rate), 0:binary_num-1, 'UniformOutput', false);
   Mapset = MapSet();
   messageSize = size(codedmessage);
   fs = 100;
 
   numSegments = 2^rate;
   segmentwidth = fix((fs/2) / numSegments + 1);
   Increment = fix(segmentwidth / 2);
   segment1 = Increment + (0:numSegments-1) * segmentwidth;


    frequencyRange = -(fs/2):1:(fs/2) - 1;
    dominantFrequencies = [];


    frequencySpectrum = abs(fftshift(fft(codedmessage, [], 2), 2)); 
    [~, maxIndices] = max(frequencySpectrum, [], 2); 
    dominantFrequencies = abs(frequencyRange(maxIndices));


    
    segmentthreshold = zeros(1, 2^rate);
    for i= 1 : 2^rate - 1
        segmentthreshold(1, i + 1) = (segment1(1, i + 1) - segment1(1, i)) / 2 + segment1(1, i);
    end
    binarySequence = [];

   segmentThreshold = (segment1(1, 2:end) + segment1(1, 1:end-1)) / 2;
    binarySequence = cell(1, messageSize(1));


    for i = 1:messageSize(1)

    segmentIndex = find(dominantFrequencies(1, i) < segmentThreshold, 1);
    if isempty(segmentIndex)
        segmentIndex = 2^rate;
    end

    binarySequence{i} = binary_num{segmentIndex};
    end

       binarySequence = [binarySequence{:}];

    bitsforchar = 5;
    binarySequenceLength = length(binarySequence);
    count = 1;
 
    for k = 1 : bitsforchar : binarySequenceLength
        startIdx = k;
        endIdx = min(k + bitsforchar - 1, binarySequenceLength);
      
        groupedBinary{count} = binarySequence(startIdx : endIdx);
        count = count + 1;
    end

    binarySequence = groupedBinary;
    decodedMessage = [];
    mapLength = size(Mapset);

    decodedMessageCell = {}; 
for m = 1 : messageSize(1) * rate / bitsforchar
    for n = 1 : mapLength(1, 2)
  
        if all(binarySequence{1, m} == Mapset{2, n})
            decodedMessageCell{end+1} = Mapset{1, n}; 
        end
    end
end
decodedMessage = strjoin(decodedMessageCell);  
