const util = require('util');
const { readFile, writeFile } = require('fs');

const nodeVersion = process.env.NODE_VERSION;
const npmVersion = process.env.NPM_VERSION;

// Test write to file
writeFile('./log/test.txt', `Running Node.js version ${nodeVersion}`, (err) => {

    if (err) {
        console.error(err);
        process.exit(1);
    }

    // Test read file
    readFile('./log/test.txt', (readErr, data) => {

        if (readErr) {
            console.error(readErr);
            process.exit(1);
        }

        console.log('data', data.toString());
        console.log(`Node version: ${nodeVersion}`);
        console.log(`NPM version: ${npmVersion}`);
        console.log(util.inspect(process.env));
        console.log(util.inspect(process.versions));

    });


});

