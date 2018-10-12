var mysql = require('mysql');

var Connection = mysql.createConnection({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'Valdj271',
    database: 'jorges'
});
Connection.connect();
module.exports = Connection;