<script>
  import { TabGroup, Tab } from "@skeletonlabs/skeleton";
  import { useNodeViewContext } from "@prosemirror-adapter/svelte";
  import mermaid from "mermaid";

  let tabSet = 0;
  const contentRef = useNodeViewContext('contentRef');

  let diagramContainer;

  async function renderDiagram() {
//    const { svg } = await mermaid.render("mermaid", contentRef.innerHTML);
    //diagramContainer.innerHTML = svg;
  }

  $: tabSet === 1 && contentRef && renderDiagram();
</script>

<TabGroup>
	<Tab bind:group={tabSet} name="tab1" value={0}>Code</Tab>
	<Tab bind:group={tabSet} name="tab2" value={1}>Diagram</Tab>
	<svelte:fragment slot="panel">
		{#if tabSet === 0}
    <div use:contentRef/>
		{:else if tabSet === 1}
     <!-- <span bind:this={diagramContainer} /> -->
    {/if}
	</svelte:fragment>
</TabGroup>
