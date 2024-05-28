# Ice skates symulation

Projekt symuluje ruch łyżew na lodzie, uwzględniając zasady fizyki. Umożliwia wizualizację trajektorii ruchu oraz analizę zmian prędkości i położenia w czasie. 

## Wymagania

* Julia 1.10.3
* Plots

## Instalacja

1. Sklonuj repozytorium:
   ```sh
   git clone https://github.com/Weisjan/Ice-skates-symulation.git
   ```
2. Zaimportuj bibliotekę "Plots":
   ```sh
   Import Pkg
   Pkg.add("Plots")
   ```
3. Uruchom plik projektu w środowisku Julia:
   ```sh
   include("lyzwy.jl")
   ```
4. Ustaw odpowiednie parametry, takie jak masa łyżwiarza, siła odpychająca, przyspieszenie, oraz parametry symulacji.


## Pliki

| Nr | Nazwa Pliku | Opis 
|----|------------|-------|
| 1  | lyzwy.jl | Główny plik projektu zawierający implementację symulacji ruchu łyżew
| 2  | Readme.md | Plik Readme

## Opis działania

* `stworz_elipse(center_x, center_y, radius_x, radius_y, n=100)`: Tworzy elipsę o zadanych parametrach.
* `nowe_wspolrzedne_1(t, x_1, klatki, v_akt, x_2, y_1, y_2)`: Oblicza nowe współrzędne dla łyżwy pierwszej w kolejnej chwili.
* `nowe_wspolrzedne_2(t, x_1, klatki, v_akt, x_2, y_1, y_2)`: Oblicza nowe współrzędne dla łyżwy drugiej w kolejnej chwili.
* `przyspieszanie(v_akt, predkosc_maksymalna, a, czas_przyspieszania, opoznienie, skala)`: Symuluje ruch łyżew.

## Uwagi

- Domyślne parametry mogą nie być zgodne z rzeczywistością. Są one przybliżone w celu przedstawienia działania symulacji

## Autor

[Jan Weis](https://github.com/Weisjan)
