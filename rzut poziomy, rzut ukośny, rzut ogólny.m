clear;
clc;

g = 9.81;                                                         %przyciaganie ziemskie

fprintf('punkt a) - rzut poziomy)\n');
fprintf('-----------\n');

vo = input ("ustaw predkosc poczatkowa w m/s: ");
ho = input ("ustaw wysokosc poczatkowa: ");

vox = vo;                                                         % wektor vox
printf('predkosc poczatkowa vox wynosi: %.6g m/s\n' , vox);  

voy = 0;                                                          % wektor voy
fprintf('predkosc poczatkowa voy wynosi: %.6g m/s\n' , voy);

tlotu = sqrt (2 * ho / g);                                        % czas lotu, przy ho < 0 wynikiem dzialania moze byc liczba zespolona, ktorej dziedzina moze byc kilka rozwiazan
fprintf('czas lotu wynosi: %.6g s\n', abs(tlotu));                % wartosc bezwzgledna, by wyswietlic wynik czasu lotu

z = vox * tlotu;                                                  % zasieg lotu
fprintf('zasieg lotu poziomego wynosi: %.6g m\n', z);        
 
xmax = 1.5 * z;                                                   % zakres skal osi x, 1,5 * zasieg rzutu
ymax = 1.5 * ho;                                                  % zakres skal osi y, 1,5 * zasieg wysokosci
%axis ([0,100,0,100])                                             % ustalanie dlugosci osi za pomoca podania parametro x i y)

t=linspace(0, z);                                                 % funkcja linspace tworzy wektor który rozpoczyna siê od wartoœci 0 a koñczy na wartoœci 'z' - zasiegu wyrzutu ciala

x = vo * t;                                                       % postac zmiennej 'x' w rzucie poziomym
y = ho - g / 2 * t .^ 2;                                          % postac zmiennej 'y' w rzucie poziomym

ytor = ho - 1/2 * t .^ 2 * ( g / vo .^ 2);                        % wzor funkcji na rzut poziomy z wykorzystaniem zmiennej 't'

fig1 = figure;
plot ( t, ytor, [0, xmax], [0, 0] );                              % rysowanie funkcji za pomoc¹ komendy plot, dodatkowa linia na poziomie 0,0

xlim("auto");                                                     % limit na osi x, ustawiony na wartosc 'auto', gdyz wartosci na osiach moga byc ujemne
ylim("auto");                                                     % limit na osi y, ustawiony na wartosc 'auto', gdyz wartosci na osiach moga byc ujemne
grid on;                                                          % dodanie siatki
xlabel('Oœ X');                                                   % nazwa osi x
ylabel('Oœ Y');                                                   % nazwa osi y
title('Rzut poziomy');                                            % tytu³ wykresu
%text (x, y, 'poziomy' );                                         % tekst umieszczany na lini punktow x,y
saveas(fig1, 'poziomy.png');
fprintf('-----------\n');


fprintf('punkt b) - rzut ukosny (poczatek rzutu w srodku uklady wspolrzednych\n');
fprintf('-----------\n');

vo = input ("ustaw predkosc poczatkowa w m/s: ");
katalpha = input("ustaw, w stopniach, poczatkowy kat nachylenia trajektorii rzutu: ");
a = deg2rad(katalpha);                                            % wartoœæ k¹ta w przeliczeniu na radiany
                                    
vox = vo * cos(a);                                                % wektor vox
printf('predkosc poczatkowa vox wynosi: %.6g m/s\n' , vox); 

voy = vo * sin(a);                                                % wektor voy
fprintf('predkosc poczatkowa voy wynosi: %.6g m/s\n' , voy); 

twznoszenia = voy / g;                                            % czas wznoszenia do osiagniecia max wysokosci
tlotu = 2 * twznoszenia;                                          % calkowity czas lotu
fprintf('czas lotu wynosi: %.6g s\n', abs(tlotu));                % wartosc bezwzgledna, by wyswietlic wynik czasu lotu

z = vox * tlotu;                                                  % zasieg wyrzutu
fprintf('zasieg lotu ukosnego wynosi: %.6g m\n', z);              
                                                 
hmax = voy ^ 2 / (2 * g);                                         % maksymalna wysokoœæ na jakiej znajdzie siê cia³o
fprintf('maksymalna wysokosc lotu ukosnego wynosi: %.6g m\n', hmax);

xmax = 1.5 * z;                                                   % zakres skal osi x w rzucie ukoœnym
ymax = 1.5 * hmax;                                                % zakres skal osi y w rzucie ukoœnym

t=linspace(0, z);                                                 % funkcja linspace tworzy wektor który rozpoczyna siê od wartoœci 0 a koñczy na wartoœci 'z' - zasiegu wyrzutu ciala

x = vo * t * cos(a);                                              % postac zmiennej 'x'
y = vo *  t * sin(a) - ((1 / 2) * g * t .^ 2);                    % postac zmiennej 'y'

ytor = t * tan(a) - (1/2) * g / ( vo * cos(a)).^2 * t.^2;         % wzor funkcji na rzut ukoœny z wykorzystaniem zmiennej 't'

fig2 = figure;
plot ( t, ytor, [0, xmax], [0, 0] );                              % rysowanie funkcji za pomoc¹ komendy plot, dodatkowa linia na poziomie 0,0

xlim("auto");                                                     % limit na osi x, ustawiony na wartosc 'auto', gdyz wartosci na osiach moga byc ujemne
ylim("auto");                                                     % limit na osi y, ustawiony na wartosc 'auto', gdyz wartosci na osiach moga byc ujemne
grid on;                                                          % dodanie siatki
xlabel('Oœ X');                                                   % nazwa osi x
ylabel('Oœ Y');                                                   % nazwa osi y
title('Rzut ukoœny');                                             % tytu³ wykresu
%text (x, y, 'ukoœny' );                                          % tekst umieszczany na lini punktow x,y
saveas(fig2, 'ukoœny.png');
fprintf('-----------\n');


fprintf('punkt c) - przypadek uogolniony\n');
fprintf('-----------\n');

vo = input ("ustaw predkosc poczatkowa w m/s: ");
katalpha = input("ustaw, w stopniach, od 90 do 270, poczatkowy kat nachylenia trajektorii rzutu: ");
a = deg2rad(katalpha);                                            % wartoœæ k¹ta w przeliczeniu na radiany

ho = input ("ustaw wysokosc poczatkowa w m (rowniez wartosci ujemne na osi x): ");

vox = vo * cos(a);                                                % wektor vox
printf('predkosc poczatkowa vox wynosi: %.6g m/s\n' , vox);  

voy = vo * sin(a);                                                % wektor voy
fprintf('predkosc poczatkowa voy wynosi: %.6g m/s\n' , voy); 

tlotu = (voy + sqrt(voy .^ 2 + 2 * g * ho)) / g;                  % wzor na czas lotu w przypadku ogolnym, przy ho <0, wynik moze byc liczba zespolona.
fprintf('czas lotu wynosi: %.6g s\n', abs(tlotu));                % wartosc bezwzgledna, by wyswietlic wynik czasu lotu

z = vox * tlotu;                                                  % wzor na zasieg lotu
fprintf('zasieg lotu w przypadku ogolnym wynosi: %.6g m\n', z); 

if katalpha > 0                                                   % warunek maksymalnej wysokosci
  hmax = ho + voy ^ 2 / (2 * g);                            
else
  hmax = ho;
end

fprintf('maksymalna wysokoœæ lotu w przypadku ogolnym wynosi: %.6g m\n', hmax); 

xmax = 1.5 * z;                                                   % zakres skal osi x, 1,5 * zasieg rzutu
ymax = 1.5 * hmax;                                                % zakres skal osi y, 1,5 * zasieg wysokosci

t=linspace(0, tlotu);                                             % funkcja linspace tworzy wektor który rozpoczyna siê od wartoœci 0 a koñczy na wartoœci 'tlotu' 

x = vox * t;                                                      % postac zmiennej 'x' w rzucie przypadku ogolnego
y = ho + voy * t - g / 2 * t .^ 2;                                % postac zmiennej 'y' w rzucie przypadku ogolnego

fig3 = figure;
plot ( x, y );                                                    % wywo³anie funkcji za pomoc¹ parametrów x i y, rysowanie funkcji za pomoc¹ komendy plot 

xlim("auto");                                                     % limit na osi x, ustawiony na wartosc 'auto', gdyz wartosci na osiach moga byc ujemne
ylim("auto");                                                     % limit na osi y, ustawiony na wartosc 'auto', gdyz wartosci na osiach moga byc ujemne
grid on;                                                          % dodanie siatki
xlabel('Oœ X');                                                   % nazwa osi x
ylabel('Oœ Y');                                                   % nazwa osi y
title('przypadek rzutu ogolnego');                                % tytu³ wykresu
%text (x, y, 'poziomy' );                                         % tekst umieszczany na lini punktow x,y
saveas(fig3, 'ogolny.png');
