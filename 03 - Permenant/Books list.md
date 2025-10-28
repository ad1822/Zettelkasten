## Books list

```dataview
Table author as Author, ("![|100](" + cover + ")") as Cover, pages, category as genre, status
From "09 - Books Metadata"
```


##  Books to read

```dataview
Table author as Author, ("![|100](" + cover + ")") as Cover, pages, category as genre, status
From "09 - Books Metadata"
Where contains(status, "to read")
```
