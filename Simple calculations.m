% losowanie 1000 liczb z przedzialu, zaokraglenie do liczb calkowitych <-10; 10>
for i=1:1000
  x=rand();
  y=fix(-11+22*x);
  Losowe(i)=y;
end
disp('wyswietlenie tekstowe zbioru losowego')
disp(Losowe);

% wyswietlenie graficzne zbioru losowego
plot(Losowe);

% usuniecie wartosci ujemnych, prezentacja zbioru liczb nieujemnych
Losowedodatnie = Losowe(Losowe>=0)

disp('ilosc elementow nieujemnych')
m = length(Losowedodatnie)

%algorytm sortowania przez wybieranie

Wybieranie = Losowedodatnie;
for j=1:m
  min=j;
for k=j+1:m
if(Wybieranie(k) < Wybieranie(min))
  min=k;
  end
end
if(j~=min)
  zamiana=Wybieranie(j);
  Wybieranie(j)=Wybieranie(min);
  Wybieranie(min)=zamiana;
  end
end

%algorytm sortowania babelkowego

Babelkowe = Losowedodatnie;
zamianaBabelkowe = 1;
while(zamianaBabelkowe)
  zamianaBabelkowe = 0;
    for b = 1:m-1
    if(Babelkowe(b)>Babelkowe(b+1))
      temp = Babelkowe(b+1);
      Babelkowe(b+1)=Babelkowe(b);
      Babelkowe(b)=temp;
      zamianaBabelkowe=1;
      end
    endfor
end

% wywo³anie funkcji algorytmów

Wybieranie
Babelkowe

%porownanie zbiorow po sortowaniaach

if(Wybieranie == Babelkowe)
  disp('zbiory s¹ równe')
end

% srednie, mediany, kwantyle, odchylenia

sredniaWybieranie = mean(Wybieranie)
sredniaBabelkowe = mean(Babelkowe)
medianaWybieranie = median(Wybieranie)
medianaBabelkowe = median(Babelkowe)
kwantyleWybieranie = quantile(Wybieranie)
kwatyleBabelkowe = quantile(Babelkowe)
odchylenieStandardoweWybieranie = std(Wybieranie)
odchylenieStandradoweBabelkowe = std(Babelkowe)
odchylenieSredniokwadratoweWybieranie = rms(Wybieranie)
odchylenieSredniokwadratoweBabelkowe = rms(Babelkowe)


