% Przedmiot: Techniki Obliczeniowe 
% Kierunek studiów: Mechatronika 
% Semestr: 2
% Rok akademicki: 2019/2020
% Data (dzień-miesiąc-rok): <<18-06-2020>>
%
% Imię:             <<Dominik>>
% Nazwisko:         <<Jankowski>>
% Numer albumu ZUT: <<47291>>  

format long;

% patrz   Iterative Methods for Linear Systems

N = 100;
A = rand(N) + 100 * eye(N);
b = rand(N, 1);


for K= 1:100
    tic
    x = A \ b;
 t(K) = toc;
 subplot(2, 1, 1); 
plot(t); drawnow
end


%x = inv(A) * b;
%x = pinv(A) * b;



for L=1:100
    tic
tol = 10.^-50;
x_pcg = pcg(A,b);
t_pcg(L) = toc;
subplot(2, 1, 2); 
 plot(t_pcg); drawnow
end
