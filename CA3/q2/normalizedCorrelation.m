function correlationMap = normalizedCorrelation(PCB, IC)
    % Convert IC image to double for precision in calculations
    IC = double(IC);
    
    % Get dimensions of IC and PCB images
    [IC_height, IC_width] = size(IC);
    [PCB_height, PCB_width] = size(PCB);

    % Initialize an empty matrix to store correlation values
    correlationMap = zeros(PCB_height - IC_height + 1, PCB_width - IC_width + 1);

    % Iterate over possible positions in the PCB image where IC can fit
    for row = 1:(PCB_height - IC_height + 1)
        for col = 1:(PCB_width - IC_width + 1)
            % Extract a sub-image from PCB matching the IC's size
            subImage = double(PCB(row:row + IC_height - 1, col:col + IC_width - 1));

            % Calculate the normalized cross-correlation
            numerator = sum(sum(IC .* subImage));
            denominator = sqrt(sum(sum(IC .* IC)) * sum(sum(subImage .* subImage)));
            correlationMap(row, col) = numerator / denominator;
        end
    end
end