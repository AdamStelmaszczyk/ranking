# Ranking
##### Aplikacja internetowa do prowadzenia rankingu graczy

<p align="center">
  <img src=http://i.imgur.com/GeSiUis.png>
</p>

## Instalacja na serwerze produkcyjnym

Pobierz wszystkie pliki z repozytorium poleceniem `git clone https://github.com/AdamStelmaszczyk/ranking.git`. Jeśli nie chcesz używać gita możesz pobrać [paczkę ZIP](https://github.com/AdamStelmaszczyk/ranking/archive/master.zip).

Pliki z głównego katalogu repozytorium skopiuj (np. przez FTP) do głównego katalogu serwera MySQL + PHP.  
Darmowy serwer z domeną bez reklam oferuje np. www.000webhost.com.

## Import bazy danych

Po zalogowaniu się do phpMyAdmina (lub innego klienta MySQL) tworzymy nową bazę. W phpMyAdmin klikamy na zakładkę Databases lub wybieramy istniejącą bazę z panelu po lewej, jeśli nasz hosting narzuca nam określoną bazę.

Po wybraniu bazy, klikamy w zakładkę Import, a następnie w przycisk Choose File i wskazujemy plik `baza.sql`, który znajduje się w katalogu głównym repozytorium. Po wciśnięciu przycisku Go na dole strony, struktura bazy z przykładowymi danymi zostanie zaimportowana.

W tym momencie strona rankingu powinna wyświetlać błąd połączenia z bazą danych.
Szczegóły połączenia z bazą MySQL należy podmienić w pliku `connect.php`.

To wszystko! Ranking już powinien śmigać. Przykładowe dane można śmiało usunąć (np. w phpMyAdmin).

## Środowisko programistyczne dla chcących rozwijać ranking

Środowiskiem programistycznym jest lokalny Apache, MySQL i PHP. Instalacja:
- [Systemy uniksopodobne](http://www.ubuntu.pl/forum/viewtopic.php?t=120154) (zalecane)
- [Windows](http://www.php-fusion.pl/articles.php?article_id=46&rowstart=1)

