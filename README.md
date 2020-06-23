# MVC-GroupProject
Członkowie grupy: Moryń Maciej, Wenda Artur

# Spis treści
1. [Informacje ogólne](#informacje-ogólne)
    * [Konfiguracja i pierwsze włączenie](#konfiguracja-i-pierwsze-wczenie)
2. [Technologie](#użyte-technologie)
3. [Wartstwy MVC](#warstwy-mvc)
	* i. [Widoki](#widoki)
	* ii. [Kontrolery](#kontrolery)
	* iii. [Modele](#modele)
		+ [Comment](#comment)
		+ [Project](#project)
		+ [News](#news)
		+ [Tag](#tag)
		+ [User](#user)
4. [Bazy Danych](#baza-danych)
	* [Tabele](#tabele)
		+ [Comments](#comments)
		+ [Posts](#posts)
		+ [Post_Tag](#post-tag)
		+ [Tags](#tags)
		+ [Users](#users)

# Informacje ogólne
Aplikacja internetowa do umieszczania projektów (z ich statusami oraz możliwością pobrania),
posiadająca wyszukiwarkę zawężającą listę projektów działającą na zasadzie słów kluczowych (tagów)
przypisanych do poszczególnych projektów.

## Konfiguracja i pierwsze włączenie
Informacje związane z konfigracją i ustawianiem lokalnego serwera z projektem można znaleźć tutaj: [instrukcja.md](/Konfiguracja/instrukcja.md)

# Użyte technologie
- [HTML](https://www.w3schools.com/html/)
- [CSS](https://www.w3schools.com/css/)
- SCSS
- [JavaScript](https://www.w3schools.com/js/)
- [Node JS](https://nodejs.org/en/)
- [Bootstrap](https://getbootstrap.com/)
- [Bootswatch](https://bootswatch.com/)
- [PhP](https://www.php.net/)
- [Symfony](https://symfony.com/)
- [Twig](https://twig.symfony.com/)
- [MySQL](https://www.mysql.com/)

# Warstwy MVC

## Widoki
* 	Widok index, na stronie głównej newsy dotyczące projektów, możliwość przejścia do stron z listą projektów (z wyszukiwarką tagów),
	oraz newsów, panelu logowania się oraz do wyszukiwarki projektów po nazwie
*	Widok search, czyli strona do wyszukiwania projektów po ich nazwie
*	Widok projects, czyli strona z listą projektów wraz z ich krótkimi opisami oraz tagami; możliwość zawężenia listy poprzez
	wybranie odpowiednich tagów.
*	Panel administracyjny newsów, lista newsów wraz z możliwością dodania, modyfikacji i usunięcia newsa
*	Panel administracyjny projektów, lista projektów wraz z możliwością dodania, modyfikacji i usunięcia projektu
*	Widok logowania, czyli logowanie się na stronę
*	Widok edycji danych, czyli możliwośc edycji danych użytkownika
*	Widok edycji projektu, gdzie można edytować i usunąć projekt
*	Widok edycji newsa, gdzie można edytować i usunąć news
*	Widok projektu
*	Widok newsa
	
## Kontrolery
- 	ProjectController, pozwalający wylistować, pokazać, wyszukać projekt oraz dodać/wyświetlić komentarze; posiada wersje admina, w 	której można dodać, edytować i usunąć projekt	
- 	NewsController, pozwalający wylistować i pokazać newsa; posiada wersje admina, w której można dodać, edytować i usunąć projekt	
- 	SecurityController, obsługuje logowanie i wylogowywanie się na stronie
- 	UserController, zarządza wszystkimi możliwościami edycji użytkownika

## Modele
### Comment
- id: int
- post: Post
- content: string
- publishedAt: DateTime
- author: User
- isLegitComment(): bool
- getId(): int?
- getContent(): string?
- setContent(): void
- getPublishedAt(): DateTime
- setPublishedAt(): void
- getAuthor(): User?
- setAuthor(): void
- getPost(): Post?
- setPost(): void

### Project
- id: int
- title: string
- slug: string
- summary: string 
- content: string
- publishedAt: DateTime
- author: User
- comments: Comment[]
- tags: Tag[]
- getTitle(): string?
- setTitle(): void
- getSlug(): string?
- setSlug(): void
- getContent(): string?
- setContent(): void
- getPublishedAt(): DateTime
- setPublishedAt(): void
- getAuthor(): User?
- setAuthor(): void
- getComments(): Collection
- addComment(): void
- removeComment(): void
- getSummary(): string?
- setSummary(): void
- addTag(): void
- removeTag(): void
- getTags(): Collection

### News
- id: int
- title: string
- slug: string
- summary: string 
- content: string
- publishedAt: DateTime
- author: User
- getTitle(): string?
- setTitle(): void
- getSlug(): string?
- setSlug(): void
- getContent(): string?
- setContent(): void
- getPublishedAt(): DateTime
- setPublishedAt(): void
- getAuthor(): User?
- setAuthor(): void
- getSummary(): string?
- setSummary(): void

### Tag
- id: int
- name: string
- getId(): int?
- setName(): void
- getName(): string?

### User
- id: int
- fullName: string
- username: string
- email: string
- password: string
- roles: array
- getId(): int?
- setFullName(): void
- getFullName(): string?
- getUsername(): string?
- setUsername(): void
- getEmail(): string?
- setEmail(): void
- getPassword(): string?
- setPassword(): void
- getRoles(): array
- setRoles(): void
- getSalt(): string?
- eraseCredentials(): void
- serialize(): string
- unserialize(): void

# Baza Danych
## Tabele
### comments
- id: int(11)
- project_id: int(11)
- author_id: int(11)
- content: longtext
- published_at: datetime

### news
- id: int(11)
- author_id: int(11)
- title: varchar(255)
- slug: varchar(255)
- summary: varchar(255)
- content: longtext
- published_at: datetime

### projects
- id: int(11)
- author_id: int(11)
- title: varchar(255)
- slug: varchar(255)
- summary: varchar(255)
- content: longtext
- image: varchar(255)
- project_files_name: varchar(255
- published_at: datetime
- updated_at: datetime

### project_tag
- project_id: int(11)
- tag_id: int(11)

### tags
- id: int(11)
- name: varchar(255)

### users
- id: int(11)
- full_name: varchar(255)
- username: varchar(255)
- email: varchar(255)
- password: varchar(255)
- roles: longtext
