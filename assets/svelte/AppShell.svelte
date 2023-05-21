<script>
  import { AppShell } from '@skeletonlabs/skeleton';
</script>

<!--
  https://www.skeleton.dev/docs/quickstart
-->

<AppShell slotSidebarLeft="bg-surface-500/5 w-56 p-4">
	<!-- (header) -->
	<svelte:fragment slot="sidebarLeft">
    <nav class="list-nav">
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
      </ul>
    </nav>
  </svelte:fragment>
	<!-- (sidebarRight) -->
	<!-- (pageHeader) -->
	<!-- Router Slot -->
  <div class="flex h-full overflow-y-auto">
    <div class="px-1"/>
	  <slot />
  </div>
	<!-- ---- / ---- -->
	<svelte:fragment slot="pageFooter">(c) 2003</svelte:fragment>
	<!-- (footer) -->
</AppShell>
