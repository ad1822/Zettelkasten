---
cssclasses:
  - center-images
  - center-titles
---
Created: <% tp.date.now("dddd Do MMMM YYYY HH:mm:ss") %>
Tags: #dsa 
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
