<script>
  import mermaid from "mermaid";

  // The default diagram
  let diagram = `\
erDiagram
  CUSTOMER }|..|{ DELIVERY-ADDRESS : has
  CUSTOMER ||--o{ ORDER : places
  CUSTOMER ||--o{ INVOICE : "liable for"
  DELIVERY-ADDRESS ||--o{ ORDER : receives
  INVOICE ||--|{ ORDER : covers
  ORDER ||--|{ ORDER-ITEM : includes
  PRODUCT-CATEGORY ||--|{ PRODUCT : contains
  PRODUCT ||--o{ ORDER-ITEM : "ordered in"`;

  let container;

  async function renderDiagram() {
    const { svg } = await mermaid.render("mermaid", diagram);
    container.innerHTML = svg;
  }

  $: diagram && renderDiagram();
</script>

<main>
  <pre contenteditable="true" bind:innerHTML={diagram} />
  <span bind:this={container} />
</main>
