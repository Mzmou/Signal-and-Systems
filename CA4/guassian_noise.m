% Generate Gaussian noise with zero mean and unit variance
noise = randn(1, 3000);

% Calculate the mean and variance of the noise
meanNoise = mean(noise);
varianceNoise = var(noise);

% Display the calculated mean and variance
disp(['Mean of Gaussian noise: ', num2str(meanNoise)]);
disp(['Variance of Gaussian noise: ', num2str(varianceNoise)]);

% Plot histogram of the noise
histogram(noise, 'Normalization', 'pdf', 'EdgeColor', 'none'); % Normalized for PDF
hold on;

% Add mean and standard deviation lines
line([meanNoise, meanNoise], ylim, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '--', 'DisplayName', 'Mean');
line([meanNoise - sqrt(varianceNoise), meanNoise - sqrt(varianceNoise)], ylim, 'Color', 'g', 'LineWidth', 1.5, 'DisplayName', '-1 Std Dev');
line([meanNoise + sqrt(varianceNoise), meanNoise + sqrt(varianceNoise)], ylim, 'Color', 'g', 'LineWidth', 1.5, 'DisplayName', '+1 Std Dev');

% Add title and labels
title('Gaussian Noise Distribution');
xlabel('Noise Amplitude');
ylabel('Probability Density');
legend('Noise Distribution', 'Mean', 'Standard Deviation Bounds');

hold off;
