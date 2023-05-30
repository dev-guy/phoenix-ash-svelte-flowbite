<script>
import Editor from './milkdown/Editor.svelte';

const content = `\
# Clear this editor for a secret message
## h2
`;
</script>

<Editor content={content} room='one'/>
<br/>
<Editor content='This is **another** editor' room='two'/>
