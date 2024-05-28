# Ice skates simulation

Projekt symuluje ruch łyżew na lodzie, uwzględniając zasady fizyki. Umożliwia wizualizację trajektorii ruchu oraz analizę zmian prędkości i położenia w czasie. 

## Wymagania

* Julia 1.10.3
* Plots

## Instalacja

1. Sklonuj repozytorium:
   ```sh
   git clone https://github.com/Weisjan/Ice-skates-simulation.git
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

* `stworz_elipse()`: Tworzy elipsę o zadanych parametrach.
* `nowe_wspolrzedne_1()`: Oblicza nowe współrzędne dla łyżwy pierwszej w kolejnej chwili.
* `nowe_wspolrzedne_2()`: Oblicza nowe współrzędne dla łyżwy drugiej w kolejnej chwili.
* `przyspieszanie()`: Symuluje przyspieszenie łyżew.

## Uwagi

- Domyślne parametry mogą nie być zgodne z rzeczywistością. Są one przybliżone w celu przedstawienia działania symulacji

## Autor

[Jan Weis](https://github.com/Weisjan)
