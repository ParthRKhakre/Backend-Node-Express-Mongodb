const express = require('express');

const app  = express();
app.use(express.json());
                                                                /*
    Notes file structure 
    note = {
    title : "this is my first note"
    description:"this is my description"
    }

    Array of notes : 
    const notes = [
        {
    title : "this is my first note"
    description:"this is my description"
        },{
    title : "this is my first note"
    description:"this is my description"
        },{
    title : "this is my first note"
    description:"this is my description"
            }
          ]
                                                                */
    const notes = []

    /* title and description  will be given by user */    
    app.post("/notes",(req,res)=>{
        notes.push(req.body);

        res.status(201).json({
            message:"note created successfully"
        });
    })


    /* retrieve the data from the server */
    app.get("/notes",(req,res)=>{
        res.status(200).json({
            message : "notes fetched successfully",
            notes:notes
        })
    })

    /* delete /notes/ : index */
    app.delete("/notes/:index",(req,res)=>{ 
        const index = req.params.index
       delete notes[index];
        res.status(200).json({
            message:"note deleted"
        })
    })

    /* Update a particular note */
    app.patch("/notes/:index",(req,res)=>{
        const index = req.params.index;
        const title = req.body.title;
        const description = req.body.description;

        notes[index].title = title;
        notes[index].description = description;

        res.status(200).json({
            message:"note updated"
        })
    })

module.exports = app 