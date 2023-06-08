<script>
  import {
    Editor,
    rootCtx,
    remarkStringifyOptionsCtx,
    // defaultValueCtx,
  } from "@milkdown/core";

  import { commonmark } from "@milkdown/preset-commonmark";
  import { gfm } from "@milkdown/preset-gfm";
  import { collab, collabServiceCtx } from "@milkdown/plugin-collab";
  import { mermaid } from './mermaid';

  // Yjs
  import { Doc } from "yjs";
  import { WebrtcProvider } from "y-webrtc";
  // import { WebsocketProvider } from 'y-websocket';

  import { useProvider } from "./provider";
  import { empty } from "./empty";
  import { headingHashes } from "./heading-hashes";

  export let room;
  export let content;

  async function createEditor(dom) {
    const provider = useProvider();

    const editor = await Editor.make()
      .config((ctx) => {
        ctx.set(remarkStringifyOptionsCtx, { emphasis: "*" });
        ctx.set(rootCtx, dom);
        // ctx.set(defaultValueCtx, content);
      })
      .use(commonmark)
      .use(gfm)
      .use(empty)
      .use(headingHashes(provider))
      .use(collab)
      .use(mermaid(provider))
      .create();

    editor.action((ctx) => {
      const ydoc = new Doc();
      const rtc = new WebrtcProvider(room, ydoc,
      { signaling: ['ws://localhost:4444'] });
      const collabService = ctx.get(collabServiceCtx);
      collabService.bindDoc(ydoc).setAwareness(rtc.awareness);
      collabService.applyTemplate(content, (removeNode, templateNode)=> {
        return true;
      });
       collabService.connect();
    });

    return editor;
  }
</script>

<div use:createEditor />

<style>
:global(ul) {
  list-style-type: circle;
}
</style>
