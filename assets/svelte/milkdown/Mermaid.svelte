<script>
  import mermaid from "mermaid";
  import { useNodeViewContext } from "@prosemirror-adapter/svelte";
  const node = useNodeViewContext("node");
  let diagram = $node.attrs.value
  let container;

  // https://discuss.prosemirror.net/t/updating-node-attributes-after-rendering/2426 ?
async function renderDiagram() {
  // https://stackoverflow.com/questions/7394748/whats-the-right-way-to-decode-a-string-that-has-special-html-entities-in-it?lq=1
  var txt = document.createElement("textarea");
  txt.innerHTML = diagram;
  const { svg } = await mermaid.render("mermaid", txt.value);
  container.innerHTML = svg;
}

  $: diagram && renderDiagram();
</script>
<textarea bind:value={diagram} contenteditable="true"/>
<span bind:this={container} />

<style>
	textarea { width: 100%; height: 200px; }
</style>
