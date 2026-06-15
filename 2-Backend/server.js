const express = require('express');

const app = express(); // server instance created 

app.get("/",(req,res)=>{
    res.send("Hello World");
})

app.get("/about",(req,res)=>{
    res.send("About Page");
})

app.listen(8000)       // server started