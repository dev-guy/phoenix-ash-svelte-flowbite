defmodule KantanWeb.SvelteCounter do
  use KantanWeb, :live_view
  import LiveSvelte

  def render(assigns) do
    ~V"""
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

    <a href="/" ><button class='btn btn-sm variant-filled'> Back </button></a>
    <a href="/" data-phx-link="redirect" data-phx-link-state="push"><button class='btn btn-sm variant-filled'> Back </button></a>
    <button type='button' href="/" data-phx-link="redirect" data-phx-link-state="push"  class='btn btn-sm variant-filled'> Back </button>

    <h1>Increment / Decrement Number Example</h1>
    <div class='text-sm'>The number is {number}.
        <button class="bg-green-600 hover:bg-green-700 text-white text-sm px-4 py-2  border rounded-full" on:click={increase}>+</button>
        <button class="bg-red-600 hover:bg-red-700 text-white text-sm px-4 py-2  border rounded-full"on:click={decrease}>-</button>
    </div>
    """
  end

  def handle_event("set_number", %{"number" => number}, socket) do
    {:noreply, assign(socket, :number, number)}
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :number, 0)}
  end
end
