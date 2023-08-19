pkg load signal

% Configura los parámetros de grabación
fs = 44100;           % Frecuencia de muestreo en Hz
nBits = 16;           % Número de bits por muestra (ejemplo: 16 bits)
nChannels = 1;        % Número de canales (1 para mono, 2 para estéreo)
recordDuration = 2;   % Duración de la grabación en segundos

% Crea el objeto grabador de audio
recorder = audiorecorder(fs, nBits, nChannels);

% Inicia la grabación
disp('Comenzando a grabar...');
recordblocking(recorder, recordDuration);  % Grabar durante el tiempo especificado
disp('Fin de la grabación.');

% Obtiene los datos de audio grabados
audioData = getaudiodata(recorder);

% Reproduce el audio grabado
play(recorder);

% Guarda el audio en un archivo WAV
filename = 'grabacion_de_voz.wav';
audiowrite(filename, audioData, fs);
disp(['Audio guardado >>>: ' filename]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cargar señal de audio desde archivo
[y, fs] = audioread('grabacion_de_voz.wav');


% Calcular la correlacion
[corr_rr, lag_rr] = xcorr(y, y);

[pks, loc] = findpeaks(corr_rr, "DoubleSided")

cantidad = norm(loc, 1)

disp(['Cantidad de picos >>>: ' cantidad]);

% periodo es = cantidad/frecuencia_muestreo

% Mostrar la correlacion alrededor del índice teórico [0]
figure;
%stem(lag_rr(fs-20:fs+20),corr_rr(fs-20:fs+20));
plot(lag_rr,corr_rr);
title('Correlación r⋆r');
xlabel('Desplazamiento');
ylabel('Correlación');
