% Przedmiot: Techniki Obliczeniowe 
% Kierunek studiów: Mechatronika 
% Semestr: 2
% Rok akademicki: 2019/2020
% Data (dzień-miesiąc-rok): <<02-06-2020>>
%
% Imię:             <<Dominik>>
% Nazwisko:         <<Jankowski>>
% Numer albumu ZUT: <<numer albumu>>

fid =fopen('dane3.txt');
Z= textscan(fid, '%s %d %3.1f');
celldisp(Z);
fclose(fid);
