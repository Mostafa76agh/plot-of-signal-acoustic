# Audio Signal Processing with FFT and STFT in MATLAB

This repository contains MATLAB code to analyze an audio file using the Fast Fourier Transform (FFT) and Short Time Fourier Transform (STFT). The code generates 2D and 3D spectrograms, providing a frequency analysis of the audio signal over time. The comments in the code are provided in English for clarity.

## Files

- **audio_analysis.m**: The main script that performs FFT and STFT analysis on an audio file and plots the results in 2D and 3D spectrograms.

## Code Overview

1. **Reading the Audio Signal**:
   - The script reads an audio file and stores the signal and sampling frequency (`fs`).
   - Modify the file path in the `audioread` function to load a different audio file.

2. **FFT Analysis**:
   - The code calculates the FFT of the entire audio signal, providing a frequency-domain representation.
   - The amplitude of each frequency component is plotted, giving insight into dominant frequencies.

3. **STFT Analysis**:
   - STFT is computed with a specified window size and overlap.
   - The result shows how the frequency content of the signal changes over time.
   - 2D and 3D spectrograms are plotted to visualize frequency vs. time vs. amplitude.

4. **2D Spectrogram**:
   - Displays the STFT result in a 2D plot with frequency on the y-axis and time on the x-axis.
   - Intensity (amplitude) is represented by color, with a color bar indicating magnitude in decibels.

5. **3D Spectrogram**:
   - A 3D view of the spectrogram, showing time, frequency, and amplitude (magnitude in dB) in three dimensions.

## Instructions

1. **Setup**:
   - Ensure MATLAB is installed on your computer.
   - Modify the path in the `audioread` function to the location of your audio file.

2. **Running the Script**:
   - Run `audio_analysis.m` in MATLAB.
   - The script will generate:
     - A plot of the FFT amplitude for the entire audio signal.
     - 2D and 3D spectrograms showing the STFT result.

## Example Usage

```matlab
[signal, fs] = audioread('path_to_your_audio.wav');
