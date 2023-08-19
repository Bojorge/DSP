% Carga la señal de audio (reemplaza 'audio_file.wav' con la ruta de tu archivo de audio)
[audio_signal, Fs] = audioread('audio.wav');

% Calcula la autocorrelación de la señal de audio
autocorr = xcorr(audio_signal);

% Encuentra los picos en la autocorrelación
[pks, locs] = findpeaks(autocorr);

% Calcula las diferencias entre las ubicaciones de los picos
differences = diff(locs);

% Encuentra el periodo máximo (en términos de muestras)
max_period = max(differences);

% Frecuencia de muestreo (reemplaza con la frecuencia de muestreo de tu señal)
Fs = 44100;

% Calcula la frecuencia en hercios utilizando la relación Fs = 1 / T
frequency_hz = Fs / max_period;

% Reproduce la señal de audio y el tono correspondiente
duration = length(audio_signal) / Fs;
playtone(frequency_hz, Fs, duration);

disp(['El periodo estimado de la señal de audio es aproximadamente ' num2str(max_period) ' muestras.']);
disp(['La frecuencia estimada de la señal de audio es aproximadamente ' num2str(frequency_hz) ' Hz.']);

