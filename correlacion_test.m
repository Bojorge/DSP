% Crear dos señales de ejemplo
x = [1, 2, 3, 4, 5];
y = [5, 4, 3, 2, 1];

x2 = [1, 1, 1, 1, 1];
y2 = [1, 1, 1, 1, 1];

% Calcular la autocorrelación
autocorr_result = xcorr(x);

% Calcular la correlación cruzada entre x e y
xcorr_result = xcorr(x, y);


% Graficar la autocorrelación
subplot(2, 1, 1);
stem(autocorr_result);
title('Autocorrelación de x');

% Graficar la correlación cruzada
subplot(2, 1, 2);
stem(xcorr_result);
title('Correlación cruzada entre x e y');

