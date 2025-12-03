---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-11-22]]"
---
Tags: #

# JS roadmap

## 0. Setup & “Hello, JS”

```html
<!-- index.html -->
<!DOCTYPE html>
<html>
  <head>
    <title>JS Practice</title>
  </head>
  <body>
    <h1>JavaScript Practice</h1>
    <script src="script.js"></script>
  </body>
</html>
```

```js
// script.js
console.log("Hello from JavaScript!");
```

2. Teach him:

- How to open this file in browser.
    
- How to open DevTools → Console and see the log.
    
That’s the only goal: the environment feels familiar.

---

## 1. Values, Variables, Basic Operations

**Goal:** Understand `let`, `const`, basic types, `console.log`.

Explain:

- `let` vs. `const` (and mention `var` as “old, avoid”)
    
- Numbers, strings, Booleans
    

Demo:

```js
// script.js

// Numbers and strings
let age = 21;
const name = "Rohan";

console.log("Name:", name);
console.log("Age:", age);
console.log("Next year age:", age + 1);

// Booleans
let isStudent = true;
console.log("Is student?", isStudent);

// Reassigning (allowed with let)
age = 22;
console.log("Updated age:", age);

// Not allowed with const (uncomment to show error)
// name = "Another"; // TypeError
```

Concepts:

- Dynamic typing: `typeof`
    

```js
console.log(typeof name);      // "string"
console.log(typeof age);       // "number"
console.log(typeof isStudent); // "boolean"
```

---

## 2. Operators & Conditionals

**Goal:** Use `if`, `else if`, `else`, comparison and logical operators.

Explain:

- `>` `<`, `>=`, `<=`, `!==`
    
- `&&`, `||`

Demo:

```js
let score = 75;

if (score >= 90) {
  console.log("Grade: A");
} else if (score >= 75) {
  console.log("Grade: B");
} else if (score >= 60) {
  console.log("Grade: C");
} else {
  console.log("Grade: D");
}

let hasTicket = true;
let isAdult = false;

if (hasTicket && isAdult) {
  console.log("You can enter the movie.");
} else {
  console.log("You cannot enter.");
}
```

Ternary:

```js
let age = 20;
let canVote = age >= 18 ? "Yes" : "No";
console.log("Can vote?", canVote);
```

Mini-task:

- Input-style (hardcoded, no prompt): `hour` variable. If `hour < 12` → “Good morning”, `12–18` → “Good afternoon”, else → “Good evening”.
    

---

## 3. Functions & Parameters

**Goal:** Understand reusable blocks, arguments, return values.

Explain:

- Function declaration
    
- Parameters and `return`
    
- Arrow functions (basic)
    

Demo:

```js
// Declaration
function greet(name) {
  console.log("Hello,", name);
}

greet("Rohan");
greet("Ayush");

// Return value
function add(a, b) {
  return a + b;
}

let sum = add(10, 5);
console.log("Sum is:", sum);

// Arrow function version
const multiply = (x, y) => {
  return x * y;
};

console.log("Multiply:", multiply(3, 4));
```

Show that functions can use other functions:

```js
function printSquare(n) {
  const result = multiply(n, n);
  console.log("Square of", n, "is", result);
}

printSquare(5);
```

Mini-task:

- Write a `isEven(n)` function that returns true/false.
    
- Write a `describeNumber(n)` that logs:
    
    - “Positive” / “Negative” / “Zero”
        
    - and whether it’s even/odd using seven.
        

---

## 4. Arrays (Basics)

**Goal:** Store lists, access by index, simple loops.

Explain:

- `[]`, indexing,.`
    

Demo:

```js
let fruits = ["apple", "banana", "mango"];

console.log(fruits[0]); // apple
console.log(fruits.length); // 3

// Change element
fruits[1] = "orange";
console.log(fruits);

// Add element
fruits.push("grapes");
console.log(fruits);

// Remove last
let last = fruits.pop();
console.log("Popped:", last);
console.log(fruits);
```

Looping with `for`:

```js
for (let i = 0; i < fruits.length; i++) {
  console.log("Fruit", i, ":", fruits[i]);
}

// for...of
for (const fruit of fruits) {
  console.log("Fruit via for...of:", fruit);
}
```

Mini-task:

- Create an array of 5 numbers.
    
- Calculate and log the sum using a `for` loop.
    

---

## 5. Arrays (map, filter, reduce intro)

**Goal:** Show “modern” ways of working with arrays.

Explain:

- Higher-order functions: pass a function to a function.

Demo:

```js
const numbers = [1, 2, 3, 4, 5];

// map → transform
const squares = numbers.map(n => n * n);
console.log("Squares:", squares);

// filter → keep some
const evens = numbers.filter(n => n % 2 === 0);
console.log("Even numbers:", evens);

// reduce → combine into one value
const sum = numbers.reduce((acc, n) => acc + n, 0);
console.log("Sum:", sum);
```

Relate with loops: show loop version vs. map/filter.

Mini-task:

- Given coast[45, 90, 62, 77, 33]`
    
    - Filter passing marks (>= 50)
        
    - Map them to “Pass: 90”, “Pass: 62”, etc.
        

---

## 6. Objects & Basic Modeling

**Goal:** Use objects to group related data and functions.

Explain:

- `{ key: value }` structure
- Dot notation, bracket notation
- Methods (functions inside objects)

Demo:

```js
const person = {
  name: "Rohan",
  age: 21,
  city: "Mumbai",
  isStudent: true,
};

console.log(person.name);
console.log(person["city"]);

// Add & change
person.age = 22;
person.country = "India";

console.log(person);

// Method
const user = {
  name: "Ayush",
  greet: function () {
    console.log("Hi, I am", this.name);
  },
};

user.greet();
```

Array of objects:

```js
const students = [
  { name: "A", marks: 80 },
  { name: "B", marks: 60 },
  { name: "C", marks: 95 },
];

const toppers = students.filter(s => s.marks >= 75);
console.log("Toppers:", toppers);
```

Mini-task:

- Create a `book` object with `title`, `author`, `year`, and a described)` method logging a sentence.
    

---

## 7. JS + HTML: DOM Basics

**Goal:** Connect JS to page elements.

Update `index.html`:

```html
<body>
  <h1 id="main-title">JS DOM Demo</h1>
  <p class="info">Original text</p>
  <button id="change-btn">Change Text</button>

  <script src="script.js"></script>
</body>
```

In `script.js`:

```js
const title = document.getElementById("main-title");
const info = document.querySelector(".info");
const button = document.getElementById("change-btn");

console.log(title.textContent);
console.log(info.textContent);

// Change content
title.textContent = "DOM is working!";
info.textContent = "Text changed by JavaScript.";
```

Explain:

- `getElementById`, .extContent`,.nnerHTML` (and why inner HTML can be dangerous)
    

Mini-task:

- Add another `<p>` and change its text through JS.
    

---

## 8. Events & Simple Interactivity

**Goal:** React to user actions.

Extend HTML:

```html
<body>
  <h1 id="main-title">Counter App</h1>
  <p>Count: <span id="count-value">0</span></p>
  <button id="inc-btn">Increment</button>
  <button id="dec-btn">Decrement</button>

  <script src="script.js"></script>
</body>
```

`script.js`:

```js
let count = 0;

const countSpan = document.getElementById("count-value");
const incBtn = document.getElementById("inc-btn");
const decBtn = document.getElementById("dec-btn");

function render() {
  countSpan.textContent = count;
}

incBtn.addEventListener("click", () => {
  count++;
  render();
});

decBtn.addEventListener("click", () => {
  count--;
  render();
});

render();
```

Explain:“click”dler)`
    
- Concept of “state” (`count`) and “render” function.
    

Mini-task:

- Add a “Reset” button that sets `count = 0`.
    

---

## 9. Forms & Basic Validation

**Goal:** Read user input, prevent default form submit, show result on page.

HTML:

```html
<body>
  <h1>Simple Greeting Form</h1>
  <form id="greet-form">
    <input type="text" id="name-input" placeholder="Enter your name" />
    <button type="submit">Greet</button>
  </form>

  <p id="greet-output"></p>

  <script src="script.js"></script>
</body>
```

`script.js`:

```js
const form = document.getElementById("greet-form");
const nameInput = document.getElementById("name-input");
const output = document.getElementById("greet-output");

form.addEventListener("submit", event => {
  event.preventDefault(); // Stop page reload

  const name = nameInput.value.trim();

  if (!name) {
    output.textContent = "Please enter a name.";
    output.style.color = "red";
    return;
  }

  output.textContent = `Hello, ${name}!`;
  output.style.color = "green";

  nameInput.value = "";
});
```

Concepts:.alue` from inputs
    
- Simple validation logic
    

Mini-task:

- Add another input: `age`. If age < 18, show “You are a minor.”
    

---

## 10. Asynchronous JS: set Timeout, `fetch`, `async/await`

**Goal:** Introduce async behavior and fetching data.

First, show set Timeout:

```js
console.log("Start");

setTimeout(() => {
  console.log("This runs after 2 seconds");
}, 2000);

console.log("End");
```

Explain:

- “JS doesn’t freeze, it schedules things.”
    

Then, a simple `fetch` with a public API. For teaching, use something simple like JSON Placeholder.

```js
// Using promises (.then)
fetch("https://jsonplaceholder.typicode.com/posts/1")
  .then(response => response.json())
  .then(data => {
    console.log("Post:", data);
  })
  .catch(error => {
    console.error("Error:", error);
  });
```

Show `async/await` version:

```js
async function loadPost() {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/posts/1");
    const data = await response.json();
    console.log("Post via async/await:", data);
  } catch (err) {
    console.error("Error:", err);
  }
}

loadPost();
```

Mini-task:

- Fetch `posts/1/comments` and log the list of comments’ emails.
    

---

## 11. Small Project: “To-do List” (Basic Version)

**Goal:** Combine DOM, events, arrays, and functions.

HTML:

```html
<body>
  <h1>Todo List</h1>
  <form id="todo-form">
    <input type="text" id="todo-input" placeholder="New todo" />
    <button type="submit">Add</button>
  </form>

  <ul id="todo-list"></ul>

  <script src="script.js"></script>
</body>
```

`script.js`:

```js
let todos = [];

const form = document.getElementById("todo-form");
const input = document.getElementById("todo-input");
const list = document.getElementById("todo-list");

function renderTodos() {
  list.innerHTML = ""; // clear

  todos.forEach((todo, index) => {
    const li = document.createElement("li");
    li.textContent = todo;

    const removeBtn = document.createElement("button");
    removeBtn.textContent = "X";
    removeBtn.style.marginLeft = "8px";

    removeBtn.addEventListener("click", () => {
      todos.splice(index, 1);
      renderTodos();
    });

    li.appendChild(removeBtn);
    list.appendChild(li);
  });
}

form.addEventListener("submit", event => {
  event.preventDefault();

  const text = input.value.trim();
  if (!text) return;

  todos.push(text);
  input.value = "";
  renderTodos();
});

renderTodos();
```

Concepts to highlight:

- Keeping “state” in to-dos array
    
- Re-rendering from state instead of manually patching DOM each time
    
- Event handlers inside loops
    

Then let him extend:

- Add “Mark as done” (toggle class)
    
- Store in local Storage (if you want to go a bit further)
    

---

## 12. Light “Intermediate” Topics (High-Level)

Don’t go too deep, just expose him:

1. **Restructuring & Spread**
    

```js
const user = { name: "Rohan", age: 21, city: "Mumbai" };
const { name, age } = user;
console.log(name, age);

const nums = [1, 2, 3];
const more = [...nums, 4, 5];
console.log(more);
```

2. **Default parameters**
    

```js
function greet(name = "stranger") {
  console.log("Hello,", name);
}

greet();
greet("Ayush");
```

3. **Basic module idea** (concept only, or with `<script type="module">` if you want).
    

---

## How to Use This As a Teacher

- Don’t dump all in one go. One or two sections per session.
    
- Always:
    
    1. Explain concept in 2–3 sentences.
        
    2. Show a tiny example (from above).
        
    3. Make him type a similar-but-not-identical example himself.
        
    4. Only then move on.
        

If he can:

- Write his own small functions,
    
- Manipulate arrays/objects,
    
- Wire up DOM + events,
    
- Fetch data and display something simple,
    

then he’s solidly in “beginner–intermediate” territory and ready for frameworks or Node.




---
## References
