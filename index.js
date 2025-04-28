const express = require ("express");
const app = express ();
const cors = require ("cors");
const bodyParser = require("body-parser");
const helmet = require("helmet");

app.use(cors());
app.use(helmet());

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use((req,res,next) => {
    res.header("Access-Control-llow-Origin", "*");
    res.header("Acess-Control-Allow-Headers", "Origin, X-Requested-With,Content-TYpe,Accept, Authorization");
    if (req.method === 'OPTIONS') {
        res.header ("Access-Control-Allow-Methods","PUT, POST, GET, PATCH, DELETE");
    }
    
    
    next ();
})

module.exports = app;