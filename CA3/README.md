
# Signal and Systems - Computer Assignment 3 (CA3)

This repository contains the implementation of **Computer Assignment 3** (CA3) for the **Signal and Systems** course. The project is implemented in MATLAB and divided into three main parts:

## Table of Contents
1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Part 1: Message Encoding in an Image](#part-1-message-encoding-in-an-image)
4. [Part 2: IC Detection in PCB Images](#part-2-ic-detection-in-pcb-images)
5. [Part 3: Diabetes Prediction Using Machine Learning](#part-3-diabetes-prediction-using-machine-learning)
6. [How to Run](#how-to-run)
7. [Dependencies](#dependencies)
8. [Results](#results)

---

## Overview

This project involves solving three distinct computational problems in MATLAB:
1. Encoding a textual message into a grayscale image using binary manipulation.
2. Detecting integrated circuits (ICs) in printed circuit board (PCB) images using template matching and correlation.
3. Training and evaluating a machine learning model to predict diabetes based on medical features.

---

## Project Structure

```
Signal-and-Systems/
│
├── CA3/
│   ├── Part1_MessageEncoding/
│   │   ├── Mapset.m           # MATLAB script to create character-binary mapping
│   │   ├── coding.m           # Function to encode a message into an image
│   │   ├── decoding.m         # Function to decode the message from an image
│   │   ├── ExampleInput.png   # Example grayscale image
│   │   └── ExampleOutput.png  # Encoded image for the example message
│   │
│   ├── Part2_ICDetection/
│   │   ├── ICrecognition.m    # Function to detect ICs in PCB images
│   │   ├── PCBImage.png       # Example PCB image
│   │   ├── ICImage.png        # Template image for the IC
│   │   └── Output.png         # Output with detected ICs highlighted
│   │
│   ├── Part3_DiabetesPrediction/
│   │   ├── diabetes-training.mat        # Training dataset
│   │   ├── diabetes-validation.mat      # Validation dataset
│   │   ├── train_and_predict.m          # Main script for ML model training and evaluation
│   │   ├── TrainedModel.mat             # Saved trained model
│   │   └── Results.pdf                  # Summary of ML results
│   │
│   └── README.md           # This file
```

---

## Part 1: Message Encoding in an Image

### Objective
Embed an English textual message into a grayscale image using binary encoding while ensuring minimal visible changes.

### Implementation
1. **Character Mapping**: Create a `Mapset` matrix mapping 32 specific characters to 5-bit binary codes.
2. **Encoding Function**: The `coding` function:
   - Accepts a message, a grayscale image, and the `Mapset`.
   - Encodes the binary message into the least significant bits of selected image pixels.
3. **Decoding Function**: The `decoding` function:
   - Extracts and decodes the hidden message from the encoded image.
4. **Analysis**: Evaluate if visible changes are noticeable by comparing the original and encoded images.

---

## Part 2: IC Detection in PCB Images

### Objective
Identify and localize ICs in a PCB image using template matching and correlation.

### Implementation
1. **Correlation Coefficient**: Use a normalized 2D correlation coefficient to compare the IC template and parts of the PCB image.
2. **Rotation Handling**: The IC template is assumed to have a rotation of up to 180°.
3. **Output**: Highlight detected ICs in the PCB image with bounding rectangles.

---

## Part 3: Diabetes Prediction Using Machine Learning

### Objective
Predict diabetes based on six medical features using supervised learning.

### Implementation
1. **Dataset**: 
   - Training: `diabetes-training.mat`
   - Validation: `diabetes-validation.mat`
2. **Model Training**: Use the MATLAB **Classification Learner App** with a Linear SVM.
3. **Feature Analysis**:
   - Train the model using individual features and report their respective accuracies.
   - Identify the feature most correlated with diabetes.
4. **Model Export and Validation**:
   - Export the trained model.
   - Evaluate its accuracy on the validation dataset.

---

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Mzmou/Signal-and-Systems.git
   cd Signal-and-Systems/CA3
   ```
2. Open MATLAB and navigate to the respective part's folder.
3. Run the required script:
   - Part 1: `test_q1.m` and `test_decoding.m`
   - Part 2: `ICrecognition.m`
   - Part 3: `q3_3.m` and `q3_4.m`

---

## Dependencies

- MATLAB (R2021a or newer recommended)
- Image Processing Toolbox (for Part 1 and Part 2)
- Statistics and Machine Learning Toolbox (for Part 3)

---

## Results

### Part 1
- Successfully encoded and decoded messages with no visible distortion in the grayscale image.

### Part 2
- Detected ICs in the PCB image accurately using normalized correlation.

### Part 3
- Achieved high accuracy in predicting diabetes using the full feature set.
- Identified the most relevant features contributing to the prediction.

---

Feel free to contribute or report issues by opening a pull request or an issue.

