
// Actions (just type these in the chat yo)

// stop detection : stops the program
// Artist - Song  : Adds song to the queue (only if one is admin ir host)
// Show List      : Shows all songs currently added to the list (only if one is admin ir host)
// Clear list     : Clears entire the request list (Only host can perform this action)
// Clear list - 1 : Clears entry #1 from the list (accepts any number - only host can perform this action) 
// Remindme - 10s - Do laundry : sets a reminder in 10seconds (m - for minutes)

const requests = [];
let prevMsg;

const showList = () => {

    for ( let [k,v] of Object.entries(requests) ){
        let output = ` ${+k + 1 }.) ${v[4]} - ${v[5]} (${v[3]} Request) \n\n` 
        document.getElementById('send_text').value = output;
        sendText();
    }

};

const clearList = msg => {

    const msgParse = msg.split('-');
    msgParse[1] = +msgParse[1].trim();

    if ( msgParse[1] ) {
        const removed = requests.splice(msgParse[1] - 1, 1);

        document.getElementById('send_text').value = `Song cleared from the list: ${removed[0][5]} by ${removed[0][4]}`;
        sendText();
    }
    else{
        for ( let [k,v] of Object.entries(requests) ){requests.pop();};
        document.getElementById('send_text').value = `Request List Has been cleared by the Host`;
        sendText();
    }
}

const setReminder = ( requester, msg ) => {

    const msgArr = msg.trim().split('-');
    const amount = +msgArr[1].trim().replace(/\D/gi,'');
    const unit = msgArr[1].trim().replace(/\d/gi,'');
    const action = msgArr[2].trim();
    // console.log('Log 2: ', amount, unit); // remindme - 10s - do something cool
    
    setTimeout( ()=> {

        document.getElementById('send_text').value = `@${requester} Reminder: ${action}`;
        sendText();

    } , ( amount * 1000 ) * ( unit == 's' ? 1 : 60 ) );

};

const detectRequest = ()=> {
    // Initial checks
    const latestMsg = document.querySelectorAll('.chat-list .message')[[...document.querySelectorAll('.chat-list .message')].length - 1 ]?.innerText;
    if (!latestMsg) return; if ( latestMsg.toLowerCase() === prevMsg ) return;
    prevMsg = latestMsg.toLowerCase();
    
    // Verify proper user
    const isHost = /^Host/.test(latestMsg);
    const isAdmin = /^Admin/.test(latestMsg);
    if (!isAdmin && !isHost) return;

    // msg parsing
    const msgContent = `${latestMsg.replace(/^Host\n{2}/,'')}`;
    const requesterName = msgContent.slice(0,msgContent.indexOf(`\n\n`));
    const msgContentParsed = msgContent.replace(/^.*\n{2}/g,' ');
    console.log(msgContentParsed);

    // Task Routing
    if ( /has been added to the queue by/gi.test(msgContentParsed) ) return; // console.log('Already added!')
    if (/stop detection/gi.test(msgContentParsed) ) return clearInterval(startDetecter);
    if (/show list/gi.test(msgContentParsed) ) return showList();
    if (/clear list/gi.test(msgContentParsed) && isHost) return clearList(msgContentParsed);
    if (/remindme/gi.test(msgContentParsed) ) return setReminder( requesterName, msgContentParsed ); // set reminder - 5 mins - do laundry

    // Request Handling
    const request = msgContent.slice(msgContent.indexOf(`\n\n`)).replace(/\n{2}/,'');
    const [artist, song] = request.split('-').map(el=>el.trim());
    const currentReq = [isHost, isAdmin, msgContent, requesterName, artist, song ];
    if ( !artist || !song  ) return;

    // Don't add dups
    for ( let [k,v] in Object.entries(requests)){ if ( ( requests[k][4].toLowerCase() === artist.toLowerCase() && requests[k][5].toLowerCase() === song.toLowerCase() ) ) return;}

    requests.push(currentReq); 
    const completedMsg = `"${song.slice(0,1).toUpperCase()}${song.slice(1).toLocaleLowerCase()}" by "${artist.slice(0,1).toUpperCase()}${artist.slice(1).toLowerCase()}" has been added to the queue by ${requesterName}`;
    document.getElementById('send_text').value = completedMsg;
    sendText()
}

const startDetecter = setInterval(detectRequest, 500);


