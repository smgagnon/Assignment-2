'use strict';

require('dotenv').config()
const express = require('express');
const router = require('./router');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const session = require('express-session');

const app = express();

app.set('view engine', 'ejs');

const db = mysql.createConnection ({
    host: process.env.HOST,
    user: process.env.DBUSER,
    password:process.env.DBPASSWORD,
    database: process.env.DATABASE
})

// Connect to database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log(`Connected to database ${process.env.DATABASE}!`);
});
global.db = db;

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 }
}))
app.use(bodyParser.json()); // parse form data client
app.use('/static', express.static('static'));

// Apply Router
app.use(router);

app.listen(3000, () => {
    console.log(`Server is running on port ${process.env.PORT} @ url http://localhost:${process.env.PORT}`);
});