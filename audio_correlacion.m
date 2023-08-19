clear; clc; close all;

% Carga la señal de audio (reemplaza 'audio_file.wav' con la ruta de tu archivo de audio)
[audio_signal, Fs] = audioread('audio.wav');

% Calcula la autocorrelación de una porción de la señal de audio
portion = 1000; % Ajusta este valor según la longitud de tu señal
autocorr = xcorr(audio_signal(1:portion));

% Encuentra los picos en la autocorrelación
[pks, locs] = findpeaks(autocorr);

% Calcula las diferencias entre las ubicaciones de los picos
differences = diff(locs);

% Encuentra el periodo máximo (en términos de muestras)
max_period = max(differences);

% Imprime el periodo estimado en muestras
disp(['El periodo estimado de la señal de audio es aproximadamente ' num2str(max_period) ' muestras.']);

