<script>
  import Editor from './milkdown/Editor.svelte';

  const content = `\
  # Clear this editor for a secret message
  ## h2
  **hello**
  - [ ] task 1
  - [ ] task 2
  - [ ] task 3
  `
  +'```mermaid' + `
    graph TD;
      A-->B;
      A-->C;
      B-->D;
      C-->D;`
  </script>

  <!-- <Editor content={content} room='one'/>
  -->
  <br/>
  <Editor {content} room='two'/>
