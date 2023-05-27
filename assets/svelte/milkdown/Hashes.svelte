<script>
  // Source: https://stackblitz.com/edit/github-w7hjxh?file=README.md
  import { useWidgetViewContext } from '@prosemirror-adapter/svelte'
  import { afterUpdate } from 'svelte';
  let input = null;
  afterUpdate(() => {
    if (input) input.focus();
	});

  const spec = useWidgetViewContext('spec')
  const hashes = Array(spec?.level || 0).fill('#').join('')
</script>
<span class="hash">{hashes}</span>
<style>
  .hash {
    color: red;
    margin-right: 6px;
  }
</style>
