## Books list

```dataview
Table WITHOUT ID  ("![|100](" + cover + ")") as Cover, file.link AS Title, author as Author, pages, category as genre, status
From "08 - Bookshelf"
Where contains(status, "complete")
```

##  Books to read

```dataview
Table WITHOUT ID  ("![|100](" + cover + ")") as Cover, file.link AS Title,  author as Author, category as genre
From "08 - Bookshelf"
Where contains(status, "to read")
```
