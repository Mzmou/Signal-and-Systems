function imgGray = ensureGrayscale(img)
    % Convert image to grayscale if it has 3 channels
    if size(img, 3) == 3
        imgGray = rgb2gray(img);
    else
        imgGray = img;
    end
end
