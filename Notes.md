# Server & Express.js Notes

## What is a Server?

A **server** is a computer (or machine) that contains:

- Operating System (OS)
- Processor (CPU)
- Memory (RAM)
- Storage

What makes a server different from a regular computer is its purpose. A server is configured and programmed to **receive, process, and respond to requests** from clients (users, applications, or other systems).

---

## How a Server Works

1. Client sends a request.
2. Server receives the request.
3. Server processes the request.
4. Server sends a response back to the client.

---

## Creating a Server

To create a server, you need a programming language capable of handling network requests.

Popular choices:

- Go
- Java
- Ruby
- .NET (C#)
- JavaScript

---

## JavaScript and Node.js

JavaScript cannot directly create servers outside the browser environment.

To run JavaScript on the server, we use **Node.js**, which provides a runtime environment for executing JavaScript on the server side.

### Example

```js
const http = require("http");

const server = http.createServer((req, res) => {
    res.end("Hello, World!");
});

server.listen(3000, () => {
    console.log("Server running on port 3000");
});
```

### Explanation

- `Node.js` executes JavaScript outside the browser.
- `http.createServer()` creates a server.
- `server.listen(3000)` starts the server on port `3000`.
- The server responds with `"Hello, World!"`.

---

# Packages

## What are Packages?

Packages are pre-written pieces of code developed by open-source contributors that help developers perform common tasks without writing everything from scratch.

They provide reusable functionality, making development faster and easier.

---

## Benefits of Packages

- Reduces development time
- Avoids reinventing the wheel
- Provides tested solutions
- Improves productivity
- Simplifies complex tasks

---

## Example: Express.js

Express.js is a Node.js package that simplifies backend development.

```js
const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send("Hello World");
});

app.listen(3000);
```

---

## Installing Packages

```bash
npm i package-name
```

### Meaning

- `npm` → Node Package Manager
- `i` → install

Packages are downloaded from the npm registry and stored locally.

---

## Running a JavaScript File

```bash
node filename.js
```

Example:

```bash
node server.js
```

---

## Node Modules Folder

The `node_modules` folder stores all installed packages and their dependencies.

---

## package.json

Maintains information about:

- Project details
- Installed dependencies
- Scripts
- Metadata

Example:

```json
{
  "dependencies": {
    "express": "^5.0.0"
  }
}
```

---

## package-lock.json

Maintains exact versions of installed packages and their internal dependencies.

This file is automatically managed by npm.

---

# Creating an Express Application

A server created using Express is a **Node.js application**.

### Initialize a Node.js Project

```bash
npm init -y
```

### Install Express

```bash
npm i express
```

Express is downloaded into the `node_modules` folder.

---

## Creating an Express Server

```js
const express = require("express");

const app = express();
```

### Explanation

- `require("express")` imports Express.
- `express()` creates an instance of the Express application.

---

## Starting the Server

```js
app.listen(portNumber, callback);
```

Example:

```js
app.listen(3000, () => {
    console.log("Server Started");
});
```

### Explanation

- `portNumber` is the port on which the application listens.
- The application becomes accessible at:

```text
http://localhost:3000
```

or

```text
http://127.0.0.1:3000
```

---

## Common Port Numbers

| Service | Port |
|----------|------|
| HTTP | 80 |
| HTTPS | 443 |
| FTP | 20 |
| SMTP (Mail) | 25 |

---

# Request and Response

### Request (`req`)

Data sent from the frontend/client to the backend.

### Response (`res`)

Data sent from the backend/server to the frontend.

---

# API (Application Programming Interface)

An API is a set of rules and protocols that allows different software systems to communicate and exchange data.

```text
Client <---- API ----> Server
```

---

## Types of APIs

- SOAP (Simple Object Access Protocol)
- REST (Representational State Transfer)
- RPC (Remote Procedure Call)
- GraphQL
- WebSocket API

---

# REST API

### Characteristics

- Uses HTTP protocol
- Supports CRUD operations
- Exchanges data using JSON or XML

### HTTP Methods

| Method | Purpose |
|----------|----------|
| GET | Fetch data |
| POST | Create/Send data |
| PATCH | Update existing data |
| PUT | Replace existing data |
| DELETE | Delete data |

---

# Recommended Folder Structure

```text
Project
│
├── node_modules
├── src
│   └── app.js
│
├── server.js
├── package.json
└── package-lock.json
```

### app.js

Contains the Express application instance.

### server.js

Starts the server.

> Keep `server.js` in the project root, not inside `src`.

---

# Request Body

When a client sends data to the server, it is typically available inside:

```js
req.body
```

---

# Postman

Postman is an API testing tool that acts like a frontend for interacting with backend APIs.

It allows developers to:

- Send requests
- Test APIs
- Inspect responses
- Debug endpoints

---

# Middleware

Middleware is a function that executes between receiving a request and sending a response.

### express.json()

Express cannot read JSON data inside the request body by default.

To parse JSON data:

```js
app.use(express.json());
```

### Example

```js
const express = require("express");

const app = express();

app.use(express.json());
```

Now JSON data sent by the client becomes available in:

```js
req.body
```

---

# Status Codes

### 201 Created

Used when a resource is successfully created.

Example:

```js
res.status(201).json({
    message: "Note Created Successfully"
});
```

---

## res.status()

Specifies the HTTP status code.

```js
res.status(200);
```

---

## res.json()

Sends data in JSON format.

```js
res.json({
    message: "Success"
});
```

---

# Route Parameters

Consider the route:

```text
/notes/:index
```

### Static Part

```text
/notes
```

### Dynamic Part

```text
:index
```

The dynamic portion is called a **Route Parameter (Params)**.

---

## Accessing Route Parameters

```js
app.get("/notes/:index", (req, res) => {
    console.log(req.params.index);
});
```

### General Syntax

```js
req.params.parameterName
```

---

# Nodemon

By default, Node.js requires restarting the server whenever changes are made.

### Install and Run Using Nodemon

```bash
npx nodemon server.js
```

### Benefits

- Automatically restarts the server
- Improves development speed
- No manual restarts needed

---

# Quick Commands

```bash
# Initialize Node Project
npm init -y

# Install Express
npm i express

# Run Application
node server.js

# Run with Nodemon
npx nodemon server.js
```