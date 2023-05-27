<script>
  // Source: https://stackblitz.com/edit/github-w7hjxh?file=README.md
  import { useWidgetViewContext } from '@prosemirror-adapter/svelte'
  const spec = useWidgetViewContext('spec')
  const hashes = Array(spec?.level || 0).fill('#').join('')
</script>
<span class="hash">{hashes}</span>
<style>
  .hash {
    color: orange;
    margin-right: 6px;
  }
</style>
