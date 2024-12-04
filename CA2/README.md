
# Vehicle License Plate Detection and Speed Estimation Project  

This project involves using MATLAB for detecting vehicle license plate numbers and estimating the speed of a vehicle from video footage. It covers various image and video processing techniques, including segmentation, binary conversion, and correlation with a custom database for character recognition.  

## Table of Contents  
- [Overview](#overview)  
- [Features](#features)  
- [Project Structure](#project-structure)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Dependencies](#dependencies)  
- [Contributing](#contributing)  

## Overview  
This project consists of four main parts:  
1. **License Plate Recognition (Part 1)**: Extract English letters and numbers from a license plate image using custom MATLAB functions.  
2. **Iranian License Plate Recognition (Part 2)**: Develop a database and extract Persian characters and numbers from license plates.  
3. **Front Plate Localization (Part 3)**: Identify and extract license plates from car front images and recognize characters.  
4. **Vehicle Speed Estimation (Part 4)**: Calculate the average speed of a vehicle using video processing in MATLAB.  

## Features  
- Develop custom MATLAB functions for common image processing tasks (e.g., grayscale conversion, binary conversion, segmentation).  
- Recognize English and Persian characters and numbers using image correlation.  
- Extract license plates from images and videos for further processing.  
- Estimate the speed of a moving vehicle using video analysis.  

## Project Structure  
- **`CA2/`**: The main folder containing all scripts and associated files for this project.  
  - `p1.m`: Script for English license plate recognition.  
  - `p2.m`: Script for Persian license plate recognition.  
  - `p3.m`: Script for front plate localization and recognition.  
  - `p4.m`: Script for vehicle speed estimation.  
  - Supporting functions:  
    - `mygrayfun.m`: Convert RGB images to grayscale.  
    - `mybinaryfun.m`: Perform binary conversion of images.  
    - `myremovecom.m`: Remove small connected components.  
    - `mysegmentation.m`: Segment binary images.  

## Installation  
1. Clone this repository or download the project files:  
   ```bash  
   git clone https://github.com/Mzmou/Signal-and-Systems.git  
   ```  
2. Navigate to the `CA2` folder:  
   ```bash  
   cd Signal-and-Systems/CA2  
   ```  
3. Ensure MATLAB is installed on your system.  

## Usage  
### English License Plate Recognition (Part 1)  
1. Run `p1.m` to process an English license plate image.  
2. Follow the prompts to load the image using `uigetfile`.  
3. View the extracted characters and numbers saved to a `.txt` file.  

### Persian License Plate Recognition (Part 2)  
1. Build a custom database of Persian characters and numbers.  
2. Run `p2.m` to process an image of an Iranian license plate.  

### Front Plate Localization (Part 3)  
1. Run `p3.m` to process a car front image.  
2. Extract and recognize the plate details similar to Part 2.  

### Vehicle Speed Estimation (Part 4)  
1. Capture a video of a moving vehicle (~10 seconds).  
2. Run `p4.m` to analyze the video and estimate vehicle speed.  

## Dependencies  
- MATLAB (tested on version R2021a and later)  
- Image Processing Toolbox  
- Video Processing Toolbox (optional, for Part 4)  

## Contributing  
This project is open for modifications and enhancements. If you'd like to contribute, please fork the repository and submit a pull request.  
