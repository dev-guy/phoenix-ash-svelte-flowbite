<script>
import Editor from './milkdown/Editor.svelte';

const content = `\
# Clear this editor for a secret message?
## h2
`;

const diagram =
`**hello**
- [ ] task 1
- [ ] task 2
- [ ] task 3
* foo
1. sldkfj
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
<Editor content={diagram} room='two'/>
