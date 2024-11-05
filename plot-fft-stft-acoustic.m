clc; clear; close all;

% Read the audio file
[signal, fs] = audioread('C:\Users\M.R\Desktop\sessions\complect_cod\Time Series Data\02_on_audio.wav');

% Calculate the length of the signal
N = length(signal);

% Create frequency vector
f = (0:N-1) * (fs / N);

% Compute the FFT of the signal segment
fftSegment = fft(signal);

% Calculate FFT amplitude
P2 = abs(fftSegment / N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2 * P1(2:end-1);

% Plot FFT
figure(1);
plot(f(1:N/2+1), P1);
title('Fast Fourier Transform (FFT)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;
axis([0 2500 0 0.014]);

% Set parameters and plot the STFT (Spectrogram)
figure(2);
window = 9600;       % Set the window length
noverlap = 7680;     % Overlap between windows
nfft = window;       % Number of FFT points

spectrogram(signal, window, noverlap, nfft, fs, 'yaxis');
title('Short Time Fourier Transform (STFT)');
xlabel('Frequency (Hz)');
ylabel('Time (s)');
colorbar;
grid on;

% Set parameters for STFT
window_length = 9600;
overlap_length = 7680;
nfft = window_length;

% Calculate STFT
[S, F, T] = spectrogram(signal, window_length, overlap_length, nfft, fs);
% Calculate absolute magnitude
S = abs(S);

% Filter out negative frequencies
positive_freqs = F >= 0;   % Keep only positive frequencies
S = S(positive_freqs, :);   % Retain only positive frequencies in STFT result
F = F(positive_freqs);      % Update frequency vector to include only positive frequencies

% Plot 2D Spectrogram (STFT)
figure;
imagesc(T, F, 10*log10(S));   % Convert intensity to decibels for better visibility
axis xy;                      % Set axis directions correctly
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('2D Spectrogram (STFT)');
colorbar;                     % Display color bar to show intensity
axis([0 max(T) 0 2500]);      % Set frequency and time limits

% Plot 3D Spectrogram (STFT)
figure;
surf(T, F, 10*log10(S), 'EdgeColor', 'none');  % Convert intensity to decibels
xlabel('Time (s)');
ylabel('Frequency (Hz)');
zlabel('Magnitude (dB)');
title('3D Spectrogram (STFT)');
colorbar;            % Display color bar to show intensity
axis tight;          % Set axis limits tightly to data
view(3);             % Set to 3D view
