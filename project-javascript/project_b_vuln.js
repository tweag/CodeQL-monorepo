const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

function initializeDatabase() {
    const db = new sqlite3.Database('example.db');
    db.serialize(() => {
        db.run("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
        db.run("INSERT INTO users (username, password) VALUES ('admin', 'adminpass')");
    });
    db.close();
}

app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    // Vulnerable to SQL injection
    const query = `SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`;
    console.log(`Executing query: ${query}`);

    const db = new sqlite3.Database('example.db');
    db.all(query, (err, rows) => {
        db.close();
        if (err) {
            return res.status(500).send("Internal server error");
        }
        if (rows.length > 0) {
            res.send("Login successful!");
        } else {
            res.send("Invalid username or password");
        }
    });
});

initializeDatabase();
app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});

