
const fetch = require('node-fetch');

let responseArr;

const getData = async () =>{

    const response = await fetch('https://www.tag-support.com/v4_6_release/apis/3.0/company/companies?pagesize=1000&page=1',{
        method: 'GET',
        mode: 'no-cors',
        headers: {
            'Authorization' : 'Basic XXX',
            'ClientId': 'XXX',
            'Content-Type': 'application/json'
        }
    });

    responseArr = await response.json();
    
    const headerObj = await response.headers;

    for (let val of headerObj){

        if (val[0] === 'link'){
            const secondLink = `${val[1]}`.split(',')[1];
            console.log(secondLink);
            const lastPageNum = +secondLink.match(/&page=\d\d|&page=\d/gi)[0].slice(6);
            console.log(lastPageNum);
        }

    }

};

getData();
