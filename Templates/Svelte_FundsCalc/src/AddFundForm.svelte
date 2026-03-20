<script>

import { createEventDispatcher } from 'svelte';
let dispatch = createEventDispatcher();

// export let expenses = [];
// import Expenses from './stores/Expenses';

let name;
let amount;

const addFund = ()=>{
    if (!amount) return;
    const data = { name, amount };
    dispatch('addFund', data );
    // Expenses.update( expenses => [...expenses, data]);
    name = null; amount = null;
};

const validateAmount = (e) => {
    const elem = e.target;
    if(+elem.value < 0) elem.value = 0;
};

const validateFields = () =>{
    if ( !name ) return dispatch('showNotificationBox', 'Please enter a name for this fund' );
    if ( !amount ) return dispatch('showNotificationBox', 'Please enter an amount' );
};

$: formIsValid = name && amount;

</script>

<form on:submit|preventDefault={ addFund } id="addFundForm">
					
    <div class="row">
        <div class="col s8 m8">
            <label>Fund Name
                <input type="text" bind:value={ name } placeholder="Enter a name " id="nameInput" required list="suggestions" autocomplete="off">
                <datalist id="suggestions">
                    <option value="Crypto">Crypto</option>
                    <option value="Savings">Savings</option>
                    <option value="Stocks">Stocks</option>
                    <option value="Other">Other</option>
                </datalist>
            </label>
        </div>

        <div class="col s4 m2">
            <label>Amount
                <input type="number" step="0.5" min="0.50" max="10000" bind:value={ amount } placeholder="$0.00" on:keyup={ validateAmount } id="amountInput" required>
            </label>
        </div>

        <div class="col s12 m2">
            <button class="btn waves-effect waves-light" class:disabled={!formIsValid} type="submit" name="action" style="top:20px;" on:click={validateFields}>Add
                <i class="material-icons right"></i>
            </button>
        </div>
    </div>

</form>

<style>

@media screen and (max-width:600px) {

    button{
        width: 100%;
    }

}

</style>