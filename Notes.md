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

Installing Packages 
npm i package-name 

npm - node package manager
i - install 

these packages are installed on the machine from the npm server 

In order to create a Express JS server use extension .js 

To Run a server use node filename.js

Node Modules folder
npm pre-written code is stored in node_modules folder

package.json maintain all the dependencies that developer is using 
 
package-lock.json file maintain the inter package dependencies 
We dont need to maintain this file it get maintain by itself
---------------------------------------------------
Server is a node JS Application if you are creating it with Express.

In Order to start(initiate) a node JS application we use command.

npm init -y 

Express is backend framework 
In order to install express use : npm i express

express module is downloaded inside the node_module folder
---------------------------------------------------
const express = require('express')

const app = express() here we created a instances of server 

# app.listen(portNumber,callback);

portNumber is the port using which application can receieve and respond to the request

after this site is opened at localhost:portNumber = 127.0.0.1

mail = 25 port number 
files  = 20 port number

req - request : data that we receive from frontend
res - response: data that server send from backend to frontend.

API(Application Programming Interface)
is a set of rules and protocol that allows different software programs to communicate and exchange data and functionality with each other.

Client <--API--> Server

Types of API
SOAP (Simple Object Access Protocol) 
REST (Representational State Transfer) 
RPC(Remote Procedure Call)
GraphQL(Graph Query Language)
Websocket API

REST API 
- Protocol used must be HTTP
- GET,POST,DELETE,PUT,PATCH
- Data Exchange XML or JSON

GET - asking(fetching) data from server
POST - send data to server 
PATCH - data is present over server we want to update it 
DELETE - delete data that is already present over server

FOLDER STRUCTURE
always create server in src folder

app.js is the standard file used to create instance of the express server 

server.js is the file used to start server (Keep server.js in root not in any folder)

--------------------------------------------------

when you receive data from the user you get it in request's body 

POSTMAN is a API tool that act as frontend for creating applications 


When you want data in req.body form use middleware
express.json() it is a middleware
Inorder to use the middleware use app.use(express.json())

express is unable to read the data present inside the body In order to read that data we use middleware express.json()

"201" status code is used when you create something successfully in backend

res.status tell about what happened with the operations

.json({}) used to return message in json format 


/notes/:index
/notes part will be static nature but the index is a dynamic part hence it changes hence the dynamic part of the routes is considered as "params"

If you want to tell the express application about the dynamic part use /:dynamic_part 

to check what value came in the dynamic part : 
req.params.dynamic_part


To Avoid the restarting of server whenever a change is made use a command : npx nodemon server.js(serverfileName)




