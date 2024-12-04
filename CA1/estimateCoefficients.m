function [alpha, beta] = estimateCoefficients(x, y)
sum_x = sum(x);
sum_y = sum(y);
sum_x2 = sum(x.^2);
sum_xy = sum(x .* y);
n=length(x);

beta = (sum_y * sum_x2 - sum_x * sum_xy) / (n * sum_x2 - sum_x^2);

alpha = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x^2);


fprintf('The value of alpha  is: %.4f\n', alpha);
fprintf('The value of beta is: %.4f\n', beta);


end
