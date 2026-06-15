# Server

## What is a Server?

A **server** is a computer (or machine) that has hardware components such as:

* Operating System (OS)
* Processor (CPU)
* Memory (RAM)
* Storage

What makes a server different from a regular computer is its purpose. A server is configured and programmed to **receive, process, and respond to requests** from clients (users, applications, or other systems).

## How a Server Works

1. A client sends a request.
2. The server receives the request.
3. The server processes the request.
4. The server sends back an appropriate response.

## Creating a Server

To create a server, you need a programming language capable of handling network requests.

Some common choices are:

* Go
* Java
* Ruby
* .NET (C#)
* JavaScript

## JavaScript and Node.js

JavaScript cannot directly create servers outside a browser environment.

To run JavaScript on a server, we use **Node.js**, which provides a runtime environment for executing JavaScript on the server side.

### Example

```javascript
const http = require("http");

const server = http.createServer((req, res) => {
    res.end("Hello, World!");
});

server.listen(3000, () => {
    console.log("Server running on port 3000");
});
```

In this example:

* `Node.js` executes the JavaScript code.
* `http.createServer()` creates a server.
* The server listens for incoming requests on port `3000`.
* When a request arrives, it responds with `"Hello, World!"`.


# Packages

## What are Packages?

Packages are pre-written pieces of code developed by open-source contributors that help developers perform common tasks without writing everything from scratch.

They provide reusable functionality, making development faster, easier, and more efficient.

## Benefits of Using Packages

* Reduces development time
* Avoids reinventing the wheel
* Provides tested and maintained solutions
* Improves productivity
* Simplifies complex tasks

## Example

In Node.js, we often use packages from **npm (Node Package Manager)**.

For example, the **Express.js** package helps developers create web servers and APIs without manually handling low-level HTTP operations.

```javascript
const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send("Hello World");
});

app.listen(3000);
```

Here, `express` is an npm package that simplifies backend development.


