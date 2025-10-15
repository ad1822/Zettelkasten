---
cssclasses:
  - center-images
  - center-titles
---
<%*
let filename = tp.file.title
if ( filename.startsWith("Untitled") ) {
  filename = await tp.system.prompt("File name: ")
  await tp.file.rename(filename)
}
%>
# <% filename %>

