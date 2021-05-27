clear; clc;

diary on;                      %stworzenie pliku diary.txt z wynikami dzialania programu

page_screen_output(0);
page_output_immediately(1);   %wyswietl natychmiast wynik, dzia³a jedynie w Octave

pkg load optim                %wczytanie toolbox'a optim

fun = @(x) (x(1)-51).^2.+(x(2)+172).^2; %funkcja celu jako funkcja od wektora x

ctl.XVmin = [-200 -200]; %gorne ograniczenie zakresu zmian x
ctl.XVmax = [200 200];    %dolne ograniczenie zakresu zmian x
ctl.constr = 1;         % ograniczenia nie mozna przekroczyc

ctl.NP = 300;           %rozmiar popukacji wektorow
ctl.refresh = 1;        %wyswietl wyniki posrednie, wartosc 0 nie daje wyswietlenia wynikow posrednich

[x_min, fun_x_min] = de_min (fun, ctl);   %optymalizuj

fprintf('\n x_min= %1.6f, %1.6f fun_x_min= %1.6f \n\n',x_min(1),x_min(2),fun_x_min); %wydrukowanie na ekran parametrow, funkcji

diary off                   %koniec pliku diary.txt