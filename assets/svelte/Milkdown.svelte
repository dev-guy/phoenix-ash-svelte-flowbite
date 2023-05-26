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
<Editor content='This is *another* editor'/>
