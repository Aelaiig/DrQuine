const fs = require('fs');
let { exec } = require('child_process');

let i = 5;

if (__filename.split('/').pop() !== 'Sully.js') { i--; }

if (i > -1) {
    let carriageReturn = String.fromCharCode(10);
    let doubleQuotes = String.fromCharCode(34);
    let kid = `Sully_${i}.js`;
    let programContent = "const fs = require('fs');%1let { exec } = require('child_process');%1%1let i = %3;%1%1if (__filename.split('/').pop() !== 'Sully.js') { i--; }%1%1if (i > -1) {%1    let carriageReturn = String.fromCharCode(10);%1    let doubleQuotes = String.fromCharCode(34);%1    let kid = `Sully_${i}.js`;%1    let programContent = %2%s%2;%1%1    const LOGGER = new console.Console(fs.createWriteStream(`./${kid}`));%1    const PROGRAM_REPLACE = %2%4%2;%1    const PROGRAM =  %4;%1%1    LOGGER.log(PROGRAM, programContent);%1%1    exec(`node ${kid}`, (err) => { if (err) { throw err; }});%1}";

    const LOGGER = new console.Console(fs.createWriteStream(`./${kid}`));
    const PROGRAM_REPLACE = "programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, i).replace(/%4/g, PROGRAM_REPLACE)";
    const PROGRAM =  programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, i).replace(/%4/g, PROGRAM_REPLACE);

    LOGGER.log(PROGRAM, programContent);

    exec(`node ${kid}`, (err) => { if (err) { throw err; }});
}
