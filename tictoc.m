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

tic
for K=1:300
    x = A \ b;

  toctime(K) = toc;
end
subplot(2, 1, 1); 
plot(toctime)



%x = inv(A) * b;
%x = pinv(A) * b;
tic
for L=1:300
tol = 10.^-50;
%x_pcg = pcg(A,b);
t_pcg = toc;
  toctime(L) = t_pcg;
end
subplot(2, 1, 2); 
plot(toctime)

%%%[std(y_div), std(y_pcg)]
