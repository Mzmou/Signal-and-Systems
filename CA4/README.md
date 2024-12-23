
# Signal and Systems - Computer Assignment 4 (CA4)

This repository contains the implementation of **Computer Assignment 4** (CA4) for the **Signal and Systems** course. The project involves simulating wireless message transmission using signals and bit encoding techniques, accounting for noise and various bit rates.

## Table of Contents
1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Part 1: Message Encoding](#part-1-message-encoding)
4. [Part 2: Message Decoding](#part-2-message-decoding)
5. [Part 3: Noise and Signal Simulation](#part-3-noise-and-signal-simulation)
6. [How to Run](#how-to-run)
7. [Dependencies](#dependencies)
8. [Results](#results)

---

## Overview

This project simulates a wireless communication system where a message is encoded, transmitted, and decoded using specific signal encoding techniques. The goal is to understand how signal encoding, noise, and bit rate affect the transmission and decoding process. The steps involved are:

1. Encoding a message into a sequence of signals using binary representation.
2. Decoding the received signal by calculating correlation.
3. Simulating noise and studying its impact on decoding accuracy.

---

## Part 1: Message Encoding

### Objective
Convert a given text message into a binary representation and encode it using a sequence of specific signals for transmission.

### Implementation
1. **Character Mapping**: A matrix `Mapset` maps 32 specific characters to 5-bit binary codes.
2. **Encoding Function**: The `coding_amp` function:
   - Takes the message and transmission speed as inputs.
   - Encodes the binary message into corresponding signals based on the bit rate.

---

## Part 2: Message Decoding

### Objective
Decode the received signal and recover the original message by calculating correlation with predefined signals.

### Implementation
1. **Decoding Function**: The `decoding_amp` function:
   - Takes the encoded signal and transmission speed as inputs.
   - Decodes the message using correlation to compare the received signal with predefined templates.
2. **Thresholding**: Based on the correlation values, decisions are made about the transmitted bits.

---

## Part 3: Noise and Signal Simulation

### Objective
Simulate noise in the received signal to assess its impact on message decoding.

### Implementation
1. **Noise Generation**: Use MATLAB’s `randn` function to add Gaussian noise with a mean of zero and varying variance.
2. **Power Control**: Modify the signal power and simulate the impact of different noise levels on decoding accuracy.
3. **Bit Rate and Noise Sensitivity**: Study the trade-off between transmission speed (bit rate) and noise resistance.

---

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Mzmou/Signal-and-Systems.git
   cd Signal-and-Systems/CA4
   ```
2. Open MATLAB and navigate to the respective part's folder.
`

---

## Dependencies

- MATLAB (R2021a or newer recommended)
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox (for noise simulation and thresholding)

---

## Results

### Part 1: Message Encoding
- Successfully encoded messages into binary form and transmitted them using predefined signals.

### Part 2: Message Decoding
- Correctly decoded the transmitted messages using correlation and thresholding techniques.

### Part 3: Noise and Signal Simulation
- Simulated Gaussian noise and observed the impact on decoding accuracy at different bit rates.
- Identified the optimal bit rate for different levels of noise.

---

Feel free to contribute or report issues by opening a pull request or an issue.

