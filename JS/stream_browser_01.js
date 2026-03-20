
// Using promises

navigator.mediaDevices.getUserMedia(


    {
        video:true,audio:true

    }

).then(stream =>{

    document.querySelector('video').srcObject = stream;
    document.querySelector('video').play()

})


// Using async/await

const startStream = async ()=>{

    let myStream = await navigator.mediaDevices.getUserMedia({
        video:true,
        audio:false
    });

    // Visible to Host
    addVideoStream(myStream, 'vid-main');

    // On new peer - send host stream
    socket.on('peer-connection-established', peerId => peerSelf.call(peerId, myStream));

};


const addVideoStream = (stream, id) => {
    
    const video = document.createElement('video');
    video.id = id;
    video.srcObject = stream
    video.addEventListener('loadedmetadata', ()=>{
        video.play()
    })
    
    vidBox.insertAdjacentElement('beforeend', video);

}