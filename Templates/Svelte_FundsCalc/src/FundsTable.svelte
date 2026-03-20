<script>
// props (propd are imported/received using the export keyword oddly enough)
export let total = 0;

import Funds from './stores/Funds';
// $: funds = $Funds; // if saving $Funds into var save as reactive statement so we catch updates
// ^ Make sure to use 'Funds' when updating as we don't merely want to update the funds var as it's only for reading from store as it changes - as is '$Funds'
// $Funds is readable and listens for any updates made to this store

import { fade, blur, fly, slide, scale } from 'svelte/transition';
import { createEventDispatcher } from 'svelte';
let dispatch = createEventDispatcher(); 

const removeFund = idx => {
    Funds.update( currentFunds => currentFunds.filter( (f,i) => i != idx) );                        // Manual Syntax -> funds = funds.filter( (f,idx) => idx != fundId);
    dispatch('showNotificationBox','Fund removed!' );
};

let editingId = -1;
let editingValue;

const editFund = ( idx, currentVal) => {
    editingId = idx;
    editingValue = currentVal;
};

const updateFundAmount = idx => {
    
    if (editingValue <= 0 ) return;
    // Since updating the store returns a truthy value, we can use that in our ternary operator condition - once this executes & updates we can return/update new store
    // Updating the store with new value -> currentFunds[editingId].amount = editingValue
    Funds.update( currentFunds => ( currentFunds[editingId].amount = +editingValue ) ? currentFunds : 0 );
    editingId = -1;
};

// Save al funds to local storage
$: localStorage.setItem('savedFunds', JSON.stringify($Funds));

</script>

{#if $Funds.length === 0}
    <p>💵 Add items below to begin... </p>
{:else}
    <table class="striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Fund</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
                {#each $Funds as item, idx (idx)}
                    <tr class="fundRow" in:scale={ {duration:300} } out:fly|local={ { duration: 300, y: 100 } } >
                        <td>{ idx + 1 }</td>
                        <td>{ item.name }</td>

                            <!-- Change to input if editing -->
                            {#if editingId === idx }
                                <td>
                                    <input class="center-align" style="width:93px;" type="number" step="0.5" min="0.50" max="10000" placeholder="$0.00" bind:value={editingValue}  required>
                                </td>
                            {:else}
                                <td>${ (+item.amount).toFixed(2) }</td>
                            {/if}                    
                            
                        <!-- Edit/Delete buttons -->
                        <td>  
                            {#if editingId === idx }
                                <a class="btn-floating btn-small waves-effect waves-light teal lighten-2 z-depth-1 tooltipped" data-position="bottom" data-tooltip="Update" href="javascript:;" on:click={ ()=> updateFundAmount(idx) } transition:scale={true} >
                                    <i class="material-icons">check</i>
                                </a>
                            {:else}
                                <a class="btn-floating btn-small waves-effect waves-light teal lighten-2 z-depth-1 tooltipped" data-position="bottom" data-tooltip="Edit" href="javascript:;" on:click={ ()=> editFund(idx, (+item.amount).toFixed(2)) } transition:scale={true} >
                                    <i class="material-icons">edit</i>
                                </a>
                            {/if}

                            <a class="delete-btn btn-floating btn-small waves-effect waves-light red lighten-1 z-depth-1 tooltipped" data-position="bottom" data-tooltip="Remove" href="javascript:;" on:click={ ()=> removeFund(idx) } transition:scale={true} >
                                <i class="material-icons">delete</i>
                            </a>
                        </td>
                    </tr>
                {/each}
            </tbody>
            <tfoot>
                <tr>
                    <td></td>
                    <td>Total</td>
                    <td>${ (total).toFixed(2) }</td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
{/if}
        

<style>

tfoot{
    border-top: 1px solid hsl(0deg,0%,80%);
    background-color: hsla(0deg, 0%, 88%, 1);
    font-weight: 600;
}

table :is(td, th):nth-of-type(3){
    width: 20%;
    text-align: center;
}

.delete-btn{ margin-left: 15px; }

th:nth-of-type(1){ width: 10%; } 
th:nth-of-type(2){ width: 50%; } 
th:nth-of-type(4){ width: 20%; text-align: center; } 

@media screen and (max-width:725px) {
    
    th:nth-of-type(2){ width: 40%; } 
    th:nth-of-type(4){ width: 30%; } 

}

</style>