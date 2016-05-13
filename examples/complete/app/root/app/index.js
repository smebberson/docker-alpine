
var express = require('express'),
    session = require('express-session'),
    RedisStore = require('connect-redis')(session),
    app = express();

// Setup session management.
// It's fine to use specific domain and port for Redis as Consul service discovery will take care of IP resolving.
app.use(session({
    store: new RedisStore({
        url: 'redis://redis.service.consul:6379'
    }),
    secret: 'alpine linux and redis'
}));

app.get('/', function (req, res) {

    // Increment the count.
    (typeof req.session.count === 'undefined') ? req.session.count = 1 : req.session.count++;

    // Return a simple response including the page hit counter (demonstrates sticky-session).
    return res.send(`Node.js responding on host ${process.env.HOSTNAME} (count: ${req.session.count}).`);

});

app.get('/ping', function (req, res) {
    return res.status(200).end();
});

app.listen(4000, function () {
    console.log('Node.js running and awaiting incomming connections on port 4000.');
});
