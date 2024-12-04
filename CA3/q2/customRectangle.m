function customRectangle(PCB, IC, ROI_data)
    % Get dimensions of the IC image
    [IC_height, IC_width, ~] = size(IC);
    
    % Define a threshold for determining regions of interest
    threshold = 0.9;

    % Display the PCB image and prepare to overlay rectangles
    figure, imshow(PCB);
    hold on;

    % Iterate through each ROI data element
    for i = 1:length(ROI_data)
        % Convert the cell ROI data to a matrix and find significant indices
        ROI_matrix = cell2mat(ROI_data(1, i));
        significantIndices = find(ROI_matrix > threshold);

        % Convert to row and column indices of the significant regions
        [rows, columns] = ind2sub(size(ROI_matrix), significantIndices);

        % Draw rectangles around each region of interest
        for k = 1:length(rows)
            rectangle('Position', [columns(k), rows(k), IC_width, IC_height], ...
                      'EdgeColor', 'b', 'LineWidth', 2);
        end
    end

    % Display the updated figure with rectangles
    drawnow;
end