function [corrOriginal, corrRotated] = computeCorrelations(template, mainGray)
    % Compute cross-correlation for template and its 180-degree rotation
    corrOriginal = normxcorr2(template, mainGray);
    templateRotated = imrotate(template, 180);
    corrRotated = normxcorr2(templateRotated, mainGray);
end
