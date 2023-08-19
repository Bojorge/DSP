pkg load signal

% Cargar señal de audio desde archivo
[y, fs] = audioread('grabacion_de_voz.wav');

% Preprocesamiento (opcional)
% Aquí puedes realizar preprocesamiento adicional si es necesario

% Calcular la transformada de Fourier de la señal
Y = fft(y);

% Obtener el espectro de amplitud
amplitude_spectrum = abs(Y);

% Encontrar la frecuencia dominante (índice del pico más alto)
[~, index] = max(amplitude_spectrum);
dominant_frequency_index = index - 1;

% Calcular la frecuencia correspondiente
dominant_frequency = dominant_frequency_index * fs / length(y);

% Calcular el período correspondiente
period = 1 / dominant_frequency;

fprintf('Frecuencia dominante: %.2f Hz\n', dominant_frequency);
fprintf('Período estimado: %.2f segundos\n', period);

% Graficar el espectro de amplitud
frequencies = (0:length(y)-1) * fs / length(y);
figure;
plot(frequencies, amplitude_spectrum);
title('Espectro de Amplitud');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');

% Mostrar señal de audio en el dominio del tiempo
figure;
t = (0:length(y)-1) / fs;
plot(t, y);
title('Señal de Audio');
xlabel('Tiempo (s)');
ylabel('Amplitud');

% Esperar para cerrar las gráficas
pause;

