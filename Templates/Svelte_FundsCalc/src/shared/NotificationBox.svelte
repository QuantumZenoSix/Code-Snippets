<script>
///// Props - destructure all 

///// Method 1. Not preferred - destructure from 'props' var

// export let props;
// let { notificationMsg = '', notificationDuration = 3000, showingNotificationBox = false } = props;


///// Method 2. Preferred - destructure $$props - this contains all props passed into this component under $$props.props
let { notificationMsg = '', notificationDuration = 3000, showingNotificationBox = false } = $$props.props;

// Imports
import { createEventDispatcher } from 'svelte';
import { fade, blur, fly, slide, scale } from 'svelte/transition';
import { tweened } from 'svelte/motion';
import { expoIn } from 'svelte/easing';                                         // view easing options -> import Easings from 'svelte/easing'; Easings. 

let dispatch = createEventDispatcher();

// Tween for progress bar in notification box
const progress = tweened(0, {                                                   // const progress = tweened(0);  0 - intial value
    duration: notificationDuration,
    delay: 0,
    easing: expoIn
});                                                                             // $: console.log($progress); // $progress holds the actual tweened value

const logProps = ()=> console.log($$props);                                     // Clicking notfication box logs $$props (only for testing)

$: progressBarValue = $progress;                                                // Holds the live value of progress

$: if( showingNotificationBox) progress.set(100);                               // If notification box is being shown, show progressbar

</script>

<div id="notificationBox" transition:fade="{ {delay: 50, duration: 150 } }" on:click="{ logProps }" >

    <a class="" href="javascript:;" on:click={ ()=> dispatch('hideNotificationBox') }>
        <i class="material-icons">close</i>
    </a>
    
    { notificationMsg } 

    <progress id="progressBar" value={ progressBarValue } max="100">sdfsdf 0% </progress>

</div>

<style>
#notificationBox{
    width: 200px;
    min-height: 50px;
    background: linear-gradient(to bottom right, #8e6ab3, #121c9c);
    color: white;
    left: 30px;
    position: absolute;
    bottom: 30px;
    padding: 12px 18px;
    border-radius: 3px;
    box-shadow: 1px 2px 1px black, 1px 2px 3px white, 1px 2px 4px #414141ba, 1px 3px 7px 2px #000000c2;
    position: fixed;
    transition: 0.1s ease-out all;
}

#notificationBox:hover{
    transform: scale(1.003) translateY(-2px);
    box-shadow: 1px 2px 1px black, 1px 2px 3px white, 1px 2px 4px #414141ba, 0px 3px 11px 4px rgba(0, 0, 0, 0.459);
}

a{
    position: absolute;
    top: -10px;
    right: -11px;
    width: 20px;
    height: 20px;
    background: linear-gradient(145deg, #979797, #000000);
    border-radius: 50%;
    padding:0px;
    margin:0px;
    color:white;
    box-shadow: 2px 2px 2px #c5c5c5, 2px 2px 4px #0e0e0e;
    transition: 0.2s ease-out all;
}
a i {
    font-size: 10px;
    margin: auto;
    transform: translate(50%, -2px);
}
a:hover{
    transform: scale(1.1);
}

progress{
    height:4px;
}
</style>