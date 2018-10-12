const express = require('express')
const Joi = require('joi')
const app = express()
var db = require('./dbconnection')
var bodyParser = require('body-parser')
var urlencodedParser = bodyParser.urlencoded({ extended: false })
const port = process.env.PORT || 4200

app.use(bodyParser.json());

app.get('/', (req, res, next) => {
    res.send('Hello World!');
});

app.get('/api/:collection', (req, res) => {
    var q = 'SELECT * FROM ' + req.params.collection
    var returned = db.query(q, function (error, results, fields) {
        if (error) {
            res.status(404).send('Query resulted in NULL or Error occured!!')
            console.log('parms reads: ', req.params)
            console.log('query read: ', q)
        } else {
            const users = JSON.stringify(results)
            res.send(users)
        }
    })
});

app.get('/api/users/:username', (req, res) => {
    var q = 'SELECT * FROM `users` WHERE `username` = "' + req.params.username + '"'
    var returned = db.query(q, function (error, results, fields) {
        if (error) {
            res.status(404).send('Query resulted in NULL or Error occured!!')
            console.log('parms reads: ', req.params)
            console.log('query read: ', q)
        } else {
            const users = JSON.stringify(results)
            res.send(users)
        }
    })
});

app.post('/api/users', urlencodedParser, (req, res) => {
    const jsondata = req.body;
    const {error} = validateUser(jsondata)
    if (error) {
        res.status(400).send(error.details[0].message)
    } else {
        var arr = Object.keys(jsondata).map(function (k) { return jsondata[k] });
        values = arr.join("','")
        q = 'INSERT INTO users (username,email,addresses,phonenumbers,type,password,accountcreated,passwordexpire,lastlogin,loginfailure) VALUES (\'' + values + '\')'
        db.query(q, function (err, result) {
            if (err) {
                res.send(err);
            } else {
                res.send('Success');
            }
        });
    }
});

app.put('/api/users/:username', (req, res) => {
    len = Object.keys(req.body).length;
    var arr = Object.keys(req.body).map(function(k) { return req.body[k] });
    var q = 'UPDATE users SET ' + arr[1] +'=\''+ arr[2] + '\' WHERE username = \'' +arr[0] +'\'' 
    db.query(q, function (err, result) {
        if (err) {
            res.send(err);
        } else {
            res.send('Success')
        }
    });

})

function validateUser(user) {
    const schema = {
        username: Joi.string().min(8).max(16).required(),
        email: Joi.string().email().max(64).required(),
        password: Joi.string().min(6).max(32).required(),
        phonenumbers: Joi.string(),     //will be set of numbers
        type: Joi.string().valid('admin', 'user'),
        address: Joi.string().min(20),  //check this with googlemaps
        accountcreated: Joi.string(),   //--\
        passwordexpire: Joi.string(),   //---> THese are going to be unix time stamps
        lastlogin: Joi.string(),        //--/
        loginfailure: Joi.number()      //I dont kno'w how to do this one yet
    }
    return(Joi.validate(user, schema));
}

app.listen(port);
console.log('API server started on: ' + port);