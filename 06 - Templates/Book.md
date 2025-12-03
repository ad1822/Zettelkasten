---
cssclasses:
  - page-manila
created: "[[<% tp.date.now("YYYY-MM-DD") %>]]"
cover:
---
Tags: #book, #<% tp.file.folder(true).split("/").pop().replace(/\s+/g, "-").replace(/['".,!?;:()]/g, "") %>
<%*
let filename = tp.file.title
if ( filename.startsWith("Untitled") ) {
  filename = await tp.system.prompt("File name: ")
  await tp.file.rename(filename)
}
%>
# <% filename %>
