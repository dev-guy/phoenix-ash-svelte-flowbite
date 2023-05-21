<script>
  import { AppShell } from '@skeletonlabs/skeleton';
</script>

<!-- See https://www.skeleton.dev/components/app-shell -->
<AppShell>
  <svelte:fragment slot="header">Header</svelte:fragment>
  <svelte:fragment slot="sidebarLeft">Sidebar Left</svelte:fragment>
  <svelte:fragment slot="sidebarRight">Sidebar Right</svelte:fragment>
  <svelte:fragment slot="pageHeader">Page Header</svelte:fragment>
  <!-- Router Slot -->
  <slot />
  <!-- ---- / ---- -->
  <svelte:fragment slot="pageFooter">Page Footer</svelte:fragment>
  <svelte:fragment slot="footer">Footer</svelte:fragment>
</AppShell>
