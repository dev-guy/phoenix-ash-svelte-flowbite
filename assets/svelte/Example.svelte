<script>
    // The number prop is reactive,
    // this means if the server assigns the number, it will update in the frontend
    export let number = 1
    // pushEvent to ... push events to the server.
    export let pushEvent

    function increase() {
        // This pushes the event over the websocket
        // The last parameter is optional. It's a callback for when the event is finished.
        // You could for example set a loading state until the event is finished if it takes a longer time.
        pushEvent("set_number", {number: number + 1}, () => {})

        // Note that we actually never set the number in the frontend!
        // We ONLY push the event to the server.
        // This is the E2E reactivity in action!
        // The number will automatically be updated through the LiveView websocket
    }

    function decrease() {
        pushEvent("set_number", {number: number - 1}, () => {})
    }
</script>

<p>The number is {number}</p>
<button on:click={increase}>+</button>
<button on:click={decrease}>-</button>