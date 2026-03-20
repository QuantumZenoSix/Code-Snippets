<script>

	// // Reactive statement - executes whenever dependant values change
	// $: console.log(fullName);

	// // Reactive statement - executes whenever dependant values change (code block)
	// $: {
	// 	console.log(fullName);
	// 	console.log('This too');
	// }

	///// IMPORTS
	
	// Components
	import Header from "./Header.svelte";
	import FundsTable from "./FundsTable.svelte";
	import AddFundForm from "./AddFundForm.svelte";
	import NotificationBox from './shared/NotificationBox.svelte';

	// Animating
	import { fade, blur, fly, slide, scale } from 'svelte/transition';
    
	// LifeCycle
	import { onMount, createEventDispatcher, onDestroy } from 'svelte';

	// Store Data
	import Funds from './stores/Funds';
	
	// Old Data Storage
	// let expenses = [
	// 	{ name: 'item1', amount : 10.00 },
	// 	{ name: 'item2', amount : 20.00 },
	// 	{ name: 'item3', amount : 50.00 }
	// ];
	
	$: funds = $Funds; // Sigil syntax is preferred varation of subscribing/unsubiing below
	// const unsub = Expenses.subscribe( data => expenses = data ); // Listens for updates to our data
	// unsub();


	onMount( () => {
		
		document.addEventListener('DOMContentLoaded', function() {
			// Initialize Materialize JS functionality
			const initTooltips = () => {
				var elems = document.querySelectorAll('.tooltipped');
				var instances = M.Tooltip.init(elems, { position: 'top' } );
			};
			const floatBtns = () => {
				var elems = document.querySelectorAll('.fixed-action-btn');
				var options = { toolbarEnabled : true };
			};
			setTimeout( ()=>{initTooltips();floatBtns()}, 3000);
		});

	});

	onDestroy( ()=>{
		// Will not occur - good place to unsub from store though - if not using sigil syntax
		// unsub();
	} );


	// Utility
	let showingNotificationBox = false;
	let notificationMsg;

	// Values
	$: total = +funds.reduce( (acc, cur)=> + ( acc + ( cur?.amount ?? 0 ) ), 0);
	let notificationDuration = 3000;	

	const hideNotificationBox = () => {
		if(!showingNotificationBox) return;	
		showingNotificationBox = false;
		notificationMsg = '';
	};

	const showNotificationBox = (e, msg) =>{
		if(showingNotificationBox) return;		
		// Update Msg
		notificationMsg = e?.detail || msg;
		showingNotificationBox = true;
		// Hide after 3s
		setTimeout( () => showingNotificationBox ? showingNotificationBox = false : null, notificationDuration);
	};
	
	// Fund Handling
	const addFund = e =>{
		const fund = e.detail;
		const fundNamePresent = funds.some(e=>e.name === fund.name);

		// funds = [...funds, fund]; 	// can't push to array - svelte won't detect change
		Funds.update( currentFunds => [...currentFunds, fund ] );
		document.getElementById("addFundForm").reset();  // clear form

		if ( fundNamePresent ) return showNotificationBox(null,'Fund name already exists. Added anyway.' );
		showNotificationBox(null,'Fund added!' );
	};


</script>

<main>

	<Header>
		<!-- Basic slot  -->
		An fund tracking app built on Svelte JS 
	</Header>

	<!-- funds -->
	<div class="container funds">
		<div class="row">
			<div class="col s10 offset-s1">
				<FundsTable {total} on:showNotificationBox={showNotificationBox} />
			</div>
		</div>
	</div>

	<!-- add fund -->
	<div class="container add-fund">
		<div class="row">
			<div class="col s10 offset-s1">
				<AddFundForm on:addFund={addFund} on:showNotificationBox={showNotificationBox}  />
			</div>
		</div>
	</div>


	<!-- NotificationBox -->
	{#if showingNotificationBox}
		<NotificationBox props={ { notificationMsg, notificationDuration, showingNotificationBox } } on:hideNotificationBox={hideNotificationBox} />

	{/if}

</main>

<svelte:head>
	<!-- Materialize -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script defer src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</svelte:head>

<style>
	:global(body){
		margin: 0;
		padding:0;
		box-sizing: border-box;

	}
	
	:root{
		--primary-color: rgb(37, 37, 37);
	}
	
	main{
		background-color: hsla(240deg,20%,85%,1);
		height:100%;
	}
	
	.container{
		padding: 15px;
	}
	.container:first-of-type{
		margin-top: 70px;
	}
	
	.container.funds{
		background-color: hsla(260deg,20%,92%,1);
	}

	.container.add-fund{
		background-color: hsla(200deg,40%,95%,1);
	}



</style>