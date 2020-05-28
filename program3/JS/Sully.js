const fs = require('fs');
let { exec } = require('child_process');

let i = 5;

if (__filename.split('/').pop() !== 'Sully.js') { i--; }

function checkError(data) {
    return new Promise((resolve, reject) => {
        data.on('error', reject);
        resolve();
    })
}

async function program() {
    if (i > -1) {
        try {
            let carriageReturn = String.fromCharCode(10);
            let doubleQuotes = String.fromCharCode(34);
            let kid = `Sully_${i}.js`;
            let programContent = "const fs = require('fs');%1let { exec } = require('child_process');%1%1let i = %3;%1%1if (__filename.split('/').pop() !== 'Sully.js') { i--; }%1%1function checkError(data) {%1    return new Promise((resolve, reject) => {%1        data.on('error', reject);%1        resolve();%1    })%1}%1%1async function program() {%1    if (i > -1) {%1        try {%1            let carriageReturn = String.fromCharCode(10);%1            let doubleQuotes = String.fromCharCode(34);%1            let kid = `Sully_${i}.js`;%1            let programContent = %2%s%2;%1            const FP = fs.createWriteStream(`./${kid}`);%1%1            await checkError(FP);%1%1            const LOGGER = new console.Console(FP);%1            const PROGRAM_REPLACE = %2%4%2;%1            const PROGRAM =  %4;%1%1            LOGGER.log(PROGRAM, programContent);%1%1            exec(`node ${kid}`);%1%1        } catch (err) {%1            /*%1                don't display error%1            */%1        }%1    }%1}%1%1program();";
            const FP = fs.createWriteStream(`./${kid}`);

            await checkError(FP);

            const LOGGER = new console.Console(FP);
            const PROGRAM_REPLACE = "programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, i).replace(/%4/g, PROGRAM_REPLACE)";
            const PROGRAM =  programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, i).replace(/%4/g, PROGRAM_REPLACE);

            LOGGER.log(PROGRAM, programContent);

            exec(`node ${kid}`);

        } catch (err) {
            /*
                don't display error
            */
        }
    }
}

program();
