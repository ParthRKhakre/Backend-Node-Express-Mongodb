const express = require('express')

const app = express()

app.use(express.json())

const note = [];

app.post("/notes",(res,req)=>{

    note.push(req.body);

    res.statusCode.json({
        message:"note created successfully"
    })

})


module.exports = app;