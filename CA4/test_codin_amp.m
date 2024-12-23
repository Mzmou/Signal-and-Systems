rate=1;
inputMessage='signal';
frequency = 100;
messageLength = strlength(inputMessage);



% Plot each segment of the coded message
for i=1:3

subplot(3,1,i);
numSegments = (messageLength * 5) / i;
timeSamples = zeros(numSegments, frequency);
CodedMessage=coding_amp('signal',i);
 hold on;
    for segmentIdx = 1:numSegments
        plot(timeSamples(segmentIdx, :), CodedMessage(segmentIdx, :), 'r');
    end
    title(['Rate = ', int2str(i)]);
    hold off;
end    




