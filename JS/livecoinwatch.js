// MOVEMENT TRACKER

const mins = 1, percent = 2.5;

const track = () =>{
    
    console.clear();
    const rows = [...document.querySelectorAll('.table-row.filter-row')];
    const hourlies = [];

    rows.forEach( el=> {
        
        if (!el.querySelector('td.table-item-change-days')) return;
        
        const increasing = el.querySelector('td.table-item-change-days').classList.contains('grow');
        const hourVal = +el.querySelector('td.table-item-change-days .percent').textContent.replace('%','');
        const assetName = el.querySelector('.table-item-currency .abr.text-truncate').textContent; 
        const msg = `${assetName} has ${increasing ? 'INCREASED' : 'DECREASED' } ${hourVal} percent!`;

        if ( hourVal > percent ) console.log(msg);
        
    });
    
};

const movementTracker = setInterval(track, ( 1000 * 60) * mins);

