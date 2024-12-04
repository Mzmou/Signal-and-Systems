function ICRecognition(templateImage, mainImage, threshold)
    % ICrecognition: Locates and highlights templateImage matches in mainImage
    % using normalized cross-correlation.
    %
    % Inputs:
    %   - templateImage: Template image (IC) to find in the main image
    %   - mainImage: Main image (PCB) for searching
    %   - threshold: Correlation threshold to define significant matches

    % Convert images to grayscale if needed
    templateImage = ensureGrayscale(templateImage);
    grayMainImage = ensureGrayscale(mainImage);

    % Calculate cross-correlation for template and 180-degree rotated template
    [correlationMatrix, correlationMatrixRotated] = computeCorrelations(templateImage, grayMainImage);

    % Display main image and overlay matched regions
    figure;
    imshow(mainImage);
    title('Detected Matching Regions');
    hold on;

    % Highlight matches for original and rotated templates
    highlightMatches(correlationMatrix, templateImage, threshold, 'b');
    highlightMatches(correlationMatrixRotated, templateImage, threshold, 'g');
    
    hold off;
end




