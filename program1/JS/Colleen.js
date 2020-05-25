/*
    First comment
*/
function    decribeFile() {
    let carriageReturn = String.fromCharCode(10);
    let doubleQuotes = String.fromCharCode(34);
    let programContent = "/*%1    First comment%1*/%1function    decribeFile() {%1    let carriageReturn = String.fromCharCode(10);%1    let doubleQuotes = String.fromCharCode(34);%1    let programContent = %2%s%2;%1    let programReplace = %2%3%2;%1    let program = %3;%1    console.log(program, programContent);%1}%1%1function main(){%1    decribeFile();%1    /*%1        Second Comment%1    */%1}%1%1main();";
    let programReplace = "programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, programReplace)";
    let program = programContent.replace(/%1/g, carriageReturn).replace(/%2/g, doubleQuotes).replace(/%3/g, programReplace);
    console.log(program, programContent);
}

function main(){
    decribeFile();
    /*
        Second Comment
    */
}

main();
