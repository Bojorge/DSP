clear; clc; close all;

% Definir la frecuencia de muestreo y el período en muestras
Fs = 44100;  % Frecuencia de muestreo en Hz
periodo_muestras = 2205;  % Ejemplo: período en muestras

% Calcular la frecuencia en hertzios
frecuencia = Fs / periodo_muestras;

% Reproducir el tono correspondiente al período en muestras
playtone(frecuencia, Fs, periodo_muestras / Fs);

fprintf('Frecuencia en Hz: %.2f\n', frecuencia);

