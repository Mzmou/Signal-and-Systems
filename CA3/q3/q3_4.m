predictedLabels = trainedModel.predictFcn(diabetesvalidation);
trueLabels = diabetesvalidation.label; 
accuracy = mean(predictedLabels == trueLabels) * 100;
fprintf('Training Phase Accuracy: %.2f%%\n', accuracy);