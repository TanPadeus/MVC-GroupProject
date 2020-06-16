# MVC-GroupProject
Członkowie grupy: Moryń Maciej, Wenda Artur

# Spis treści
1. [Informacje ogólne](#informacje-og-lne)
2. [Technologie](#u-yte-technologie)
3. [Wartstwy MVC](#warstwy-mvc)
	* i. [Widoki](#widoki)
	* ii. [Kontrolery](#kontrolery)
	* iii. [Modele](#modele)
		+ [Comment](#comment)
		+ [Post](#post)
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
* Widok index, na stronie głównej newsy dotyczące projektów, możliwość przejścia do stron z listą projektów (z wyszukiwarką tagów),
	panelu logowania się oraz do wyszukiwarki projektów po nazwie
*	Widok search, czyli strona do wyszukiwania projektów po ich nazwie
*	Widok blog, czyli strona z listą projektów wraz z ich krótkimi opisami oraz tagami; możliwość zawężenia listy poprzez
	wybranie odpowiednich tagów.
	
## Kontrolery
- BlogController, pozwalający dodawać i wyszukiwać posty, posiada wersje admina, która zezwala również na edycję i usuwanie postów
- SecurityController, obsługuje logowanie i wylogowywanie się na stronie
- UserController, zarządza wszystkimi możliwościami edycji użytkownika

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

### Post
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
### Comments
- id; int(11)
- post_id; int(11)
- author_id; int(11)
- content; longtext
- published_at; datetime

### Posts
- id; int(11)
- author_id; int(11)
- title; varchar(255)
- slug; varchar(255)
- summary; varchar(255)
- content; longtext
- published_at; datetime

### Post_Tag
- post_id; int(11)
- tag_id; int(11)

### Tags
- id; int(11)
- name; varchar(255)

### Users
- id; int(11)
- full_name; varchar(255)
- username; varchar(255)
- email; varchar(255)
- password; varchar(255)
- roles; longtext
