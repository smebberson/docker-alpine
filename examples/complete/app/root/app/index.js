
var express = require('express'),
    app = express();

app.get('/', function (req, res) {
    return res.send(`Node.js responding on host ${process.env.HOSTNAME}.`);
});

app.get('/ping', function (req, res) {
    return res.status(200).end();
});

app.listen(4000, function () {
    console.log('Node.js running and awaiting incomming connections on port 4000.');
});
