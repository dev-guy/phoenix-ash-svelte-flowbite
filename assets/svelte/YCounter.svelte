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

  // The displayed counter value
  let number = 0;

  yarray.observe(event => {
    number = yarray.toArray().reduce((a,b) => a + b, 0)
  })

  // I'm not sure why you push an array instead of a number
  function increase() {
    if (yarray) yarray.push([1])
  }

  function decrease() {
    if (yarray) yarray.delete(0,1)
  }
  </script>

  <h1 class="h1">Count: {number}</h1>
  <button
    class="btn btn-sm variant-filled-error"
    on:click={decrease}>-</button
  >
  <button
    class="btn btn-sm variant-filled-success"
    on:click={increase}>+</button
  >
