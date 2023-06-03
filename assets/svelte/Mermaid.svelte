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
    const x = Math.floor(Math.random()*5000);
    const { svg } = await mermaid.render("mermaid"+x, diagram);
    container.innerHTML = svg;
  }

  $: diagram && renderDiagram();
</script>

  <pre contenteditable="true" bind:innerHTML={diagram} />
  <span bind:this={container} />
