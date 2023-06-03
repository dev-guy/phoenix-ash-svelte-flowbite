<script>
  import { TabGroup, Tab } from "@skeletonlabs/skeleton";
  import mermaid from "mermaid";

  // TODO: This should default to 0 for new nodes and should be set to 1 when the editor is first loaded
  let tabSet = 0;

  import { useNodeViewContext } from "@prosemirror-adapter/svelte";
  const node = useNodeViewContext("node");
  let diagram = $node.attrs.value
  let container;

async function renderDiagram() {
  // https://stackoverflow.com/questions/7394748/whats-the-right-way-to-decode-a-string-that-has-special-html-entities-in-it?lq=1
  // var txt = document.createElement("textarea");
  // txt.innerHTML = diagram;
  // const { svg } = await mermaid.render("mermaid", txt.value);
  const x = Math.floor(Math.random()*5000);
  const { svg } = await mermaid.render(`mermaid-${x}`, diagram);
  container.innerHTML = svg;
}

  $: tabSet === 1 && diagram && renderDiagram();
</script>

<TabGroup>
	<Tab bind:group={tabSet} name="tab1" value={0}>Code</Tab>
	<Tab bind:group={tabSet} name="tab2" value={1}>Diagram</Tab>
	<svelte:fragment slot="panel">
		{#if tabSet === 0}
      <textarea bind:value={diagram} contenteditable="true"/>
		{:else if tabSet === 1}
      <span bind:this={container} />
    {/if}
	</svelte:fragment>
</TabGroup>

<style>
	textarea { width: 100%; height: 200px; }
</style>
