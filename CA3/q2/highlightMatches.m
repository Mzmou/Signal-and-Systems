function highlightMatches(corrMatrix, template, threshold, color)
    % Identify local maxima above threshold and overlay rectangles
    localMaxima = imregionalmax(corrMatrix) & (corrMatrix > threshold);
    [row, col] = find(localMaxima);
    
    % Adjust for padding and overlay rectangles
    rowAdj = row - size(template, 1) + 1;
    colAdj = col - size(template, 2) + 1;
    for i = 1:length(rowAdj)
        rectPos = [colAdj(i), rowAdj(i), size(template, 2), size(template, 1)];
        rectangle('Position', rectPos, 'EdgeColor', color, 'LineWidth', 2);
    end
end