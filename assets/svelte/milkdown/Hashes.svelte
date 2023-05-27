<script>
  // Source: https://stackblitz.com/edit/github-w7hjxh?file=README.md
  import { useWidgetViewContext } from '@prosemirror-adapter/svelte'

  const spec = useWidgetViewContext('spec')
  const level = spec?.level
  const hashes = Array(level || 0).fill('#').join('')
</script>

<span class="hash">{hashes}</span>

<style>
  .hash {
    color: red;
    margin-right: 6px;
  }
</style>
