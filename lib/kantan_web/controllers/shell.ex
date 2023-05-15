defmodule KantanWeb.Shell do
  use KantanWeb, :live_view
  import LiveSvelte

  def render(assigns) do
    ~V"""
    <script>
    import { AppShell } from '@skeletonlabs/skeleton';
    </script>

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
    """
  end
end
