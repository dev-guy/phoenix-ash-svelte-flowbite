<script>
  import { TabGroup, Tab } from "@skeletonlabs/skeleton";
  import mermaid from "mermaid";

  // TODO: This should default to 0 for new nodes and should be set to 1 when the editor is first loaded
  let tabSet = 0;

  import { useNodeViewContext } from "@prosemirror-adapter/svelte";
  const node = useNodeViewContext("node");
  const setAttrs = useNodeViewContext("setAttrs");

  let diagram = $node.attrs.value;
  let container;

  async function renderDiagram() {
    const x = Math.floor(Math.random()*5000);
    const { svg } = await mermaid.render(`mermaid-${x}`, diagram);
    container.innerHTML = svg;
    setAttrs({ value: diagram });
  }

  $: tabSet === 1 && diagram && renderDiagram();
</script>

<span contenteditable=false>
<TabGroup>
	<Tab bind:group={tabSet} name="tab1" value={0}>Code</Tab>
	<Tab bind:group={tabSet} name="tab2" value={1}>Diagram</Tab>
	<svelte:fragment slot="panel" >
		{#if tabSet === 0}
      <textarea bind:value={diagram} contenteditable="true"/>
		{:else if tabSet === 1}
      <span bind:this={container} />
    {/if}
	</svelte:fragment>
</TabGroup>
</span>

<style>
	textarea { width: 100%; height: 200px; }
  :global(.tab-label) { display:inline-block; }
  :global(.tab-interface) { display:inline-block; }
  :global(.tab-panel) { display:inline-block; }
</style>
