<script>
import Editor from './milkdown/Editor.svelte';

const content = `\
# Clear this for a secret message
## h2

**Hello**
`;
</script>

<Editor content={content}/>
