<script>
  import { AppShell } from '@skeletonlabs/skeleton';
</script>

<AppShell>
	<!-- (header) -->
	<svelte:fragment slot="sidebarLeft">Sidebar Left</svelte:fragment>
	<!-- (sidebarRight) -->
	<!-- (pageHeader) -->
	<!-- Router Slot -->
	<slot />
	<!-- ---- / ---- -->
	<svelte:fragment slot="pageFooter">(c) 2003</svelte:fragment>
	<!-- (footer) -->
</AppShell>
