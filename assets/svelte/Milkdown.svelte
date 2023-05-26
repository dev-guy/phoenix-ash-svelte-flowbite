<script>
import Editor from './milkdown/Editor.svelte';

const content = `\
# Clear this editor for a secret message
## h2

**Hello**
`;
</script>

<Editor content={content}/>
<br/>
<h1>Proof that you can create editor:</h1>
<Editor content={content}/>
