<script>
  import Editor from './milkdown/Editor.svelte';

  const content = `\
  # Clear this line for a secret message
  `
  +'```mermaid' + `
    graph TD;
      A-->B;
      A-->C;
      B-->D;
      C-->D;`
  </script>

<h1 class='.h1'>First Editor</h1>
<Editor {content} room='one'/>

<h1 class='.h1'>Second Editor</h1>
<Editor {content} room='two'/>
