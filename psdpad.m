% Przedmiot: Techniki Obliczeniowe 
% Kierunek studiów: Mechatronika 
% Semestr: 2
% Rok akademicki: 2019/2020
% Data (dzień-miesiąc-rok): <<18-06-2020>>
%
% Imię:             <<Dominik>>
% Nazwisko:         <<Jankowski>>
% Numer albumu ZUT: <<47291>>

% Obliczanie PSD z pomocą FFT

% Czytanie wartości y, 
% rekonstrukcja wartości x.
%
[y, fs] = audioread('airplane-landing_daniel_simion.wav');

% Tylko 1 kanał
%
y = y(:,1);

sound(y, fs);

N = length(y);
Delta = 1 ./ fs; 
x = (0:(N-1))' .* Delta;
D= padarray(x,[200 0],0,'both');

% Rysowanie danych wejściowych
%
subplot(2, 1, 1); 
plot(D,y); 
title('dane'); 
xlabel('t [sekundy]')

% Jawne utworzenie skali częstotliwości.
%
f = (-N/2:N/2)' ./ (N .* Delta);

% Szybka transformacja Fouriera,
% mnożenie przez Delta jest konieczne
% jeżeli chcemy mieć dobre jednoski fizyczne.
%
F = fft(y) .* Delta;

% Przetasowanie wyników tak, aby przebiegały
% od najmniejszej wartości f, a nie od zera.
% Inaczej trochę dla parzystych/nieparzystych N.
%
if mod(N,2) == 0
  F = fftshift(F); % parzyste N
  F = [F; F(1) ]; 
else
  F = [F; F(1) ];  % nieparzyste N
  F = fftshift(F);
end

% PSD liczymy według wzoru:
%
%   p  = abs(F).^2 + abs(flipud(F)).^2;
%
% Poniżej jest nieco szybszy sposób obliczenia
% dający te same wyniki.
%
p  = 2.0*abs(F).^2;

% Zostawiamy tylko PSD dla wartości dodatnich f.
% To samo robimy ze skalą częstotliwości f.
%
p  = p(f >= 0);
pf = f(f >= 0);

% Rysujemy PSD po transformacji.
%
subplot(2, 1, 2); 
semilogx(pf, p, '-r'); 
title('PSD'); 
xlabel('f [Hz]'); 
xlim([10, 10000]);
