function labeled_image = mysegmentation(input_image)
    % Function to label connected components in a binary image
    % Input:
    % input_image: Binary image


    [rows, columns] = size(input_image);
    labeled_image = zeros(rows, columns);
    label = 0;
    
    for j = 1:columns
        for i = 1:rows
            if input_image(i, j) == 1 && labeled_image(i, j) == 0
                label = label + 1;
                stack = [i, j];

                while ~isempty(stack)
                    current_pixel = stack(1, :);
                    stack(1, :) = [];
                    x = current_pixel(1);
                    y = current_pixel(2);

                    if x >= 1 && x <= rows && y >= 1 && y <= columns && input_image(x, y) == 1 && labeled_image(x, y) == 0
                        labeled_image(x, y) = label;
                        stack = [stack; x-1, y; x+1, y; x, y-1; x, y+1];
                    end
                end
            end
        end
    end
end