defmodule KantanWeb.Svelte.Yrs do
  use KantanWeb, :live_view

  def render(assigns) do
    ~V"""
    <script>
    import * as Y from 'yjs'
    import { WebrtcProvider } from 'y-webrtc'
    import { IndexeddbPersistence } from 'y-indexeddb'

    const ydoc = new Y.Doc()

    // this allows you to instantly get the (cached) documents data
    const indexeddbProvider = new IndexeddbPersistence('count-demo', ydoc)
    indexeddbProvider.whenSynced.then(() => {
      console.log('loaded data from indexed db')
    })

    // Sync clients with the y-webrtc provider.
    const webrtcProvider = new WebrtcProvider('count-demo', ydoc)

    const yarray = ydoc.getArray('count')

    yarray.observe(event => {
      number = yarray.toArray().reduce((a,b) => a + b)
    })

    // The number prop is reactive. If the server assigns the number, it will update in the frontend
    let number = 1;
    // pushEvent to ... push events to the server.
    export let pushEvent;

    function increase() {
    if (yarray) yarray.push([1])

    // This pushes the event over the websocket
    // The last parameter is optional. It's a callback for when the event is finished.
    // You could for example set a loading state until the event is finished if it takes a longer time.
    pushEvent("set_number", { number: number + 1 }, () => {});

    // Note that we actually never set the number in the frontend!
    // We ONLY push the event to the server.
    // This is the E2E reactivity in action!
    // The number will automatically be updated through the LiveView websocket
    }

    function decrease() {
    pushEvent("set_number", { number: number - 1 }, () => {});
    }
    </script>

    <h1 class="h1">Count: {number}</h1>
    <button
      class="btn btn-sm variant-filled-success"
      on:click={increase}>+</button
    >
    <button
      class="btn btn-sm variant-filled-error"
      on:click={decrease}>-</button
    >

    """
  end

  def handle_event("set_number", %{"number" => number}, socket) do
    {:noreply, assign(socket, :number, Yrs.add(number, 1))}
    # {:noreply, assign(socket, :number, number)}
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 0, svelte_opts: %{ssr: false})}
  end
end
