# Spis treści
1. [Wymagania](#wymagania)
2. [Pierwsze odpalenie projektu](#pierwsze-odpalenie-projektu)
3. [Dodatkowe informacje](#dodatkowe-informacje)
    * [Logowanie w aplikaji](#logowanie-w-aplikaji)
    * [Konfiguracja php](#konfiguracja-php)
    * [Konfiguracja bazy danych](#konfiguracja-bazy-danych)

# Wymagania
- [Symfony CLI](https://symfony.com/download) (wersja 5.1)
- [Yarn package manager](https://classic.yarnpkg.com/en/docs/install/#windows-stable)
- Composer
- [XAMPP](https://www.apachefriends.org/pl/index.html) (wraz z nim php w wersji 7 lub wyżej)
- [PHPStorm](https://www.jetbrains.com/phpstorm/) (nie jest wymagane, wszystkie komendy można wpisywać w oknie konsoli ale zdecydowanie zalecane)

# Pierwsze odpalenie projektu
- Projekt należy pobrać na dysk z gita i wypakować do folderu
- Odpalić jako projet w PHPStorm lub otworzyć okno konsoli w folderze głównym projektu
- Odpalić XAMPP (apache oraz mySQL)
- Zaimportować bazę danych w oknie myPHPadmin (zrzut bazy dnych można znaleźć w folderze Konfiguracja. Zostały załączone 2 typy: z minimalną wersją rekordów oraz z przykładowymi danymi w aplikacji)
- Po po kolei wpisywać komendy do pierwszego skonfigurowania projektu:
    + <code>yarn install</code>
    + <code>composer install</code>
    + <code>yarn encore dev</code>
- Powyższe komendy upewnią się że wszyskie zależności potrzebne do odpalenia projektu zostaną pobrane
- Tak skonfigurowany projekt można odpalić komendą <code>symfony serve</code>
- Projekt powinien się odpalić na lokalnym serwerze (domyślnie: localhost:8000)

Po początkowej konfiguracji następne odpalenia projektu nie wymagają ponownego używania wszystkich komend. Wystarczy użyć <code>symfony serve</code> do odpalenia servera.


# Dodatkowe informacje
W razie problemów tutaj można znaleźć przykładowe rozwiązania. Jeżeli wystąpił problem inny niż wymieniony prosimy o kontakt.

## Logowanie w aplikaji
Domyślnie w zrzucie bazy danych jest wpisany jeden użytkownik o prawach administratora.
* <b>Login:</b> admin
* <b>Hasło:</b> admin123

Żeby dodać kolejnego użytkownika należy wpisać komendę <code>php bin/console app:add-user</code> i postępować zgodnie z wyświetlanymi informacjami.
Żeby dodać kolejno konto administratora należy wpisać <code>php bin/console app:add-user --admin</code> i postępować w taki sam sposób jak z dodawaniem zwykłego użytkownika.
## Konfiguracja php
Ważnym jest aby w php.ini używanej wersi php były dostępne rozszerzenia(extensions), przykładowa konfiguracja rozszerzeń dla której projekt działa poprawnie:
- extension=bz2
- extension=curl
- extension=fileinfo
- extension=gd2
- extension=gettext
- extension=intl
- extension=mbstring
- extension=exif
- extension=mysqli
- extension=pdo_mysql

## Konfiguracja bazy danych
Baza danych na której działa aplikacja jest skonfigurowana w pliku .env w katalogu głównym.
Domyślna konfiguracja przewiduje że baza danych jest postawiona na localhoście na porcie 3306.
Domyślna nazwa bazy danych to "PHP_Project_db" a użytkownik którego symfony będzie używać do połacznienia i zarzązania to root który nie posiada ustawionego hasła.
<code>mysql://root@127.0.0.1:3306/PHP_Project_db</code>

W razie jakichkolwiek problemów z połączeniem z bazą danych prosimy sprawdzić czy konfiguracja jest taka sama jak ustawiona w pliku .env.
W przeciwnym wypadku zmodyfikować połączenie albo bazę danych aby opowiadały sobie nawzajem.

