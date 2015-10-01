var static = require('node-static'),
    util = require('util');

//
// Create a node-static server to serve the current directory
//
var file = new static.Server('./public', { cache: -1, headers: {'Cache-Control': 'no-cache, must-revalidate'} });

require('http').createServer(function (request, response) {

    // automatically respond to the /env url, with a JSON string of our environment
    if (request.url === '/env') {

        response.writeHead(200,
            {
                'Content-Type': 'application/json'
            }
        );

        return response.end(util.inspect(process.env));

    }

    file.serve(request, response, function (err, res) {
        if (err) { // An error as occured
            console.error("> Error serving " + request.url + " - " + err.message);
            response.writeHead(err.status, err.headers);
            response.end();
        } else { // The file was served successfully
            console.log("> " + request.url + " - " + res.message);
        }
    });

}).listen(process.env.NODE_PORT);

console.log("> Node.js app is listening on port %s", process.env.NODE_PORT);
