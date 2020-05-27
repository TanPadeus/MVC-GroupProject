# MVC-GroupProject
Członkowie grupy: Moryń Maciej, Wenda Artur

Aplikacja internetowa do umieszczania projektów (z ich statusami oraz możliwością pobrania),
posiadająca wyszukiwarkę zawężającą listę projektów działającą na zasadzie słów kluczowych (tagów)
przypisanych do poszczególnych projektów.

Portal tematyczny projektów grupowych:

Kontroler zajmować się będzie tworzeniem nowych obiektów “projekt” (nazwa, status, krótki opis, link do pobrania, tagi)
oraz wyszukiwaniem projektów po ich tagach, jak również przekazywać odpowiednie dane projektu do modelu.
Dane do stworzenia obiektu “projekt” będą przekazywane poprzez krótki formularz na temat projektu
(dane można zmodyfikować w późniejszym terminie).

Model w aplikacji zajmie się prezentacją obiektu, tj przekaże informacje jak dany obiekt zostanie wyświetlony.
Dane szczegółowe na temat projektu zostaną mu dostarczone przez kontroler.

Aplikacja będzie posiadała kilka widoków:
1. Kreator dodawania projektów, na którym uprawnione osoby mogą dodać swój projekt wypełniając krótki formularz.
2. Strona główna z listą projektów oraz wyszukiwarką, która pozwoli usunąć niepasujące obiekty z listy.
