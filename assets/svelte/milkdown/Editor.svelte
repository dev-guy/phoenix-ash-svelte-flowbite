<script>
  import { Editor, rootCtx, defaultValueCtx } from "@milkdown/core";
  import { commonmark } from "@milkdown/preset-commonmark";
  // import { nord } from "@milkdown/theme-nord";
  import { emoji } from "@milkdown/plugin-emoji";
  import { useHashesPlugin } from '../../milkdown/hashes';

  import {
  useWidgetViewFactory
} from "@prosemirror-adapter/svelte";
import {
  useProsemirrorAdapterProvider,
} from "@prosemirror-adapter/svelte";

useProsemirrorAdapterProvider();

console.log('editorrrr');
  export let content;
  const widgetFactory = useWidgetViewFactory();

  function editor(dom) {
    Editor.make()
      .config(ctx => {
        ctx.set(rootCtx, dom);
        ctx.set(defaultValueCtx, content);
      })
      // .use(nord)
      .use(emoji)
      .use(commonmark)
      .use(useHashesPlugin(widgetFactory))
      .create();
  }
</script>

<div use:editor />
