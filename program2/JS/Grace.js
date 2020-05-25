const fs = require('fs');

let programContent = "const fs = require('fs');%1%1let programContent = %2%s%2;%1let carriageReturn = String.fromCharCode(10);%1let doubleQuotes = String.fromCharCode(34);%1%1/*%1    define output of logger%1*/%1const LOGGER = new console.Console(fs.createWriteStream('./Grace_kid.js'));%1const PROGRAM_REPLACE = %2%3%2;%1const PROGRAM =  %3;%1%1LOGGER.log(PROGRAM, programContent);";
let carriageReturn = String.fromCharCode(10);
let doubleQuotes = String.fromCharCode(34);

/*
    define output of logger
*/
const LOGGER = new console.Console(fs.createWriteStream('./Grace_kid.js'));
const PROGRAM_REPLACE = "programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, PROGRAM_REPLACE)";
const PROGRAM =  programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, PROGRAM_REPLACE);

LOGGER.log(PROGRAM, programContent);
