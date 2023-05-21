defmodule KantanWeb.Live.Index do
  use KantanWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div>
    <LiveSvelte.render name="AppShell" ssr={false}>

    <h1 class="h1">Flowbite</h1>
    <input
      phx-hook="Datepicker"
      id="myInput"
      type="text"
      class="text-sm rounded"
      placeholder="Flowbite date picker"
    />

    <h1 class="h1">LiveSvelte</h1>

    <.button navigate="/svelte/counter">Counter</.button>
    <.button navigate="/svelte/tiptap">Checklist by TipTap</.button>
    <.button navigate={~p"/svelte/mermaid"}>Mermaid</.button>
    <.button navigate="/svelte/navigationExample">Navigation</.button>

    <h1 class="h1">Svelte Skeleton</h1>

    <.button navigate={~p"/svelte/timeline"}>Svelte + Flowbite Timeline</.button>

    <h2 class="h2">Svelte Skeleton Text Examples</h2>

    <p class="text-primary-500">primary text</p>
    <p class="text-secondary-500">secondary text</p>
    <p class="text-tertiary-900">tertiary text</p>
    <p class="text-warning-500">warning text</p>
    <p class="text-error-900">error text</p>

    <h2 class="h2">Skeleton Button Examples</h2>
    <!-- https://www.skeleton.dev/elements/buttons -->
    <button class="btn btn-sm variant-filled-success">sm success</button>
    <button class="btn btn-sm variant-filled-primary">Primary sm</button>
    <button class="btn variant-filled-secondary">Secondary</button>
    <button class="btn btn-lg variant-filled-tertiary">Tertiary</button>
    <button class="btn btn-xl variant-filled-warning">Warning</button>

    <h1 class="h1">Pyro</h1>

    <h2 class="h2">Pyro Button Examples</h2>

    <.button size="sm">sm</.button>
    <.button size="md">md</.button>
    <.button size="lg">lg</.button>
    <.button size="xl">xl</.button>
    <.button color="primary">primary</.button>
    <.button color="secondary">secondary</.button>
    <.button color="tertiary">tertiary</.button>
    <.button color="warning">warning</.button>

    </LiveSvelte.render>
    </div>
    """
  end
end
