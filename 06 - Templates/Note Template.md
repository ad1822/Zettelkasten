---
cssclasses:
  - center-images
  - center-titles
created: "[[<% tp.date.now("YYYY-MM-DD") %>]]"
---
Tags: #
<%*
let filename = tp.file.title
if ( filename.startsWith("Untitled") ) {
  filename = await tp.system.prompt("File name: ")
  await tp.file.rename(filename)
}
%>
# <% filename %>



---
## References
