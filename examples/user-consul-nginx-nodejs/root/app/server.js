var static = require('node-static');

//
// Create a node-static server to serve the current directory
//
var file = new static.Server('/public', { cache: -1, headers: {'Cache-Control': 'no-cache, must-revalidate'} });

require('http').createServer(function (request, response) {

    // automatically respond to the /ping url, with an empty 200
    if (request.url === '/ping') {

        response.writeHead(200,
            {
                'Content-Length': 0,
                'Content-Type': 'text/plain'
            }
        );

        return response.end();

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

console.log("> node-static is listening on port %s", process.env.NODE_PORT);
