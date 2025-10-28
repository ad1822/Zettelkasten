---
cssclasses:
  - page-manila
---
Created: <% tp.date.now("dddd Do MMMM YYYY HH:mm:ss") %>
Tags: #book, #<% tp.file.folder(true).split("/").pop().replace(/\s+/g, "-").replace(/['".,!?;:()]/g, "") %>
<%*
let filename = tp.file.title
if ( filename.startsWith("Untitled") ) {
  filename = await tp.system.prompt("File name: ")
  await tp.file.rename(filename)
}
%>

# <% filename %>


<!-- ![[<% tp.file.folder(true).split("/").pop() %>.png]] -->

