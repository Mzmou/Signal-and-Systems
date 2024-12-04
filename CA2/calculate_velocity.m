function [velocity,firstFrame,secondFrame] = calculate_velocity(videoFile)
    video = VideoReader(videoFile);

    firstTime = 7.7;
    secondTime = 7.95;

    video.CurrentTime = firstTime;
    firstFrame = readFrame(video);
    video.CurrentTime = secondTime;
    secondFrame = readFrame(video);

    gray1 = rgb2gray(firstFrame);
    gray2 = rgb2gray(secondFrame);

    points1 = detectSURFFeatures(gray1);
    points2 = detectSURFFeatures(gray2);

    [features1, validPoints1] = extractFeatures(gray1, points1);
    [features2, validPoints2] = extractFeatures(gray2, points2);

    indexPairs = matchFeatures(features1, features2);

    matchedPoints1 = validPoints1(indexPairs(:, 1), :);
    matchedPoints2 = validPoints2(indexPairs(:, 2), :);

    displacements = matchedPoints2.Location - matchedPoints1.Location;

    averageDisplacement = mean(sqrt(sum(displacements.^2, 2)));


    timeInterval = secondTime-firstTime; 

    velocity = averageDisplacement / timeInterval;
    disp(['Velocity: ', num2str(velocity), ' pixels per second']);
end
