---
editor-width: 100
banner: "![[banner.jpeg]]"
cssclasses:
  - hide-properties (custom snippet as i have properties shown by default)
---

```dataviewjs
const dailyFolder = "04 - Daily/";
const dateFormat = "yyyy-MM-dd";

// === BUILD PATHS ===
const today = dv.date("today");
const dailyPath = `${dailyFolder}${today.toFormat(dateFormat)}`;

// === BUTTONS ===
let content = "";
content += `<a class="internal-link elegant-btn ready" href="${dailyPath}">📅 Today</a>`;

// === OUTPUT ===
dv.el("div", `<div class="breadcrumbs-wrapper">${content}</div>`); // needs DV-button snippet

```

```dataviewjs
// === Recent Notes Section ===
dv.el("h4", " Recent Notes ", { cls: "recent-header" });

const recent = dv.pages()
  .sort(p => p.file.mtime, 'desc')
  .slice(0, 5);

const container = dv.el("div", "", { cls: "recent-files-container" });

for (const page of recent) {
  const row = dv.el("div", "", { cls: "recent-file-row" });

  const link = dv.el(
    "a",
    page.file.name,
    { cls: "internal-link recent-file", href: page.file.path }
  );


  row.appendChild(link);
  container.appendChild(row);
}
```
```dataviewjs
// === Todo Section ===
dv.el("h4", " Todo", { cls: "section-header" });
dv.taskList(
  dv.pages().file.tasks
    .where(t => !t.completed)
    .sort(t => t.path, 'asc')
);
```
---
```dataviewjs
// Create container (Needs Tag-Edit snippet)

dv.el("h4", "Tags", { cls: "section-header" });
let container = dv.el("div", "", {cls: "tag-cloud-container"});

// Get all pages
let pages = dv.pages();

// Flatten all tags across all pages
let allTags = [];
for (let page of pages) {
    if (page.file.tags) {
        allTags.push(...page.file.tags);
    }
}

// Count occurrences of each tag
let tagCounts = allTags.reduce((acc, tag) => {
    acc[tag] = (acc[tag] || 0) + 1;
    return acc;
}, {});

// 🔹 Sort tags alphabetically
let sortedTags = Object.keys(tagCounts).sort((a, b) => a.localeCompare(b));

// Render each tag as clickable link
for (let tag of sortedTags) {
    let count = tagCounts[tag];
    let link = dv.el(
        "a",
        `${tag} (${count})`,
        {
            href: `obsidian://search?query=${encodeURIComponent(tag)}`,
            cls: "tag-chip"
        }
    );
    link.style.margin = "2px"; // add spacing
    container.appendChild(link);
}

```
