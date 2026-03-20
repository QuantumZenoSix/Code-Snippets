// Store to save all fund data
import { writable } from "svelte/store";

const localStore = localStorage.getItem('savedFunds');
const storeData =  localStore ? [...JSON.parse(localStore)] : [];

// Create a writeable store
const Funds = writable(storeData); 

// One could also initialize empty and fill with data later - like from API for example
// const Funds = writable([]); 
// Funds.set(storeData)


export default Funds;


////////////////////////////////////////////////////////////////

// const Funds = writable(

//     [
// 		// { name: 'Initial Investments', amount : 100.00 },
// 		// { name: 'Bank Account', amount : 1.00 },
// 		// { name: 'Wallet', amount : 0.00 }
// 	]

// ); 