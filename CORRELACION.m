pkg load signal
clear; clc; close all;

% Generar una señal aleatoria r de tamaño M=2500
M = 2500;
r = (randn(1, M) * 2) - 1;

% Mostrar las primeras 100 muestras de la señal r
figure;
subplot(2, 2, 1);
stem(r(1:100));
title('Señal aleatoria r');
xlabel('Muestra');
ylabel('Amplitud');

% Generar una señal periódica p de periodo M≪N
frecuencia = 10 / M;
p = sin(2 * pi * (1:1:M) * frecuencia);

% Mostrar las primeras 100 muestras de la señal p
subplot(2, 2, 2);
stem(p(1:100));
title('Señal periódica p');
xlabel('Muestra');
ylabel('Amplitud');

% Calcular las correlaciones
[corr_rr, lag_rr] = xcorr(r, r);
[corr_rp, lag_rp] = xcorr(r, p);
[corr_pp, lag_pp] = xcorr(p, p);
[corr_rprp, lag_rprp] = xcorr(r + p, r + p);

% Mostrar las correlaciones alrededor del índice teórico [0]
figure;

subplot(2, 2, 1);
stem(lag_rr(M-20:M+20),corr_rr(M-20:M+20));
title('Correlación r⋆r');
xlabel('Desplazamiento');
ylabel('Correlación');

subplot(2, 2, 2);
stem(lag_rp(M-20:M+20),corr_rp(M-20:M+20));
title('Correlación r⋆p');
xlabel('Desplazamiento');
ylabel('Correlación');

subplot(2, 2, 3);
stem(lag_pp(M-20:M+20),corr_pp(M-20:M+20));
title('Correlación p⋆p');
xlabel('Desplazamiento');
ylabel('Correlación');

subplot(2, 2, 4);
stem(lag_rprp(M-20:M+20),corr_rprp(M-20:M+20));
title('(r+p)⋆(r+p)');
xlabel('Desplazamiento');
ylabel('Correlación');

