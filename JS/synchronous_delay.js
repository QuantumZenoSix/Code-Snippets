// Accepts milliseconds  
function delay(n) {  
    n = n || 2000;
    return new Promise(done => {
      setTimeout(() => {
        done();
      }, n);
    });
  }

// Main function where stuff is done
async function doSomething(){
  // Do stuff
  
  console.log("Waiting 3s...")
  await delay(3000)
  console.log("Done waiting 3s!")
  
  // Do more stuff
}

doSomething()
