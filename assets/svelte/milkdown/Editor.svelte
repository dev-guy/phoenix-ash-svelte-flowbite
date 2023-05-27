<script>
  import { Editor, rootCtx, defaultValueCtx } from "@milkdown/core";
  import { commonmark } from "@milkdown/preset-commonmark";
  import { gfm } from "@milkdown/preset-gfm";
  import { emoji } from "@milkdown/plugin-emoji";

  import { useProvider } from './provider';
  import { empty } from './empty';
  import { headingHashes } from './heading-hashes';

  export let content;

  function editor(dom) {
    const provider = useProvider();

    return Editor.make()
      .config(ctx => {
        ctx.set(rootCtx, dom);
        ctx.set(defaultValueCtx, content);
      })
      .use(emoji)
      .use(commonmark)
      .use(gfm)
      .use(empty)
      .use(headingHashes(provider))
      .create();
  }
</script>

<div use:editor/>
