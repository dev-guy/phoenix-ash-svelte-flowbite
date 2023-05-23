defmodule KantanWeb.Live.Index do
  use KantanWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="h1">Flowbite</h1>
    <input
      phx-hook="Datepicker"
      id="myInput"
      type="text"
      class="text-sm rounded"
      placeholder="Calendar Picker"
    />

    <h1 class="h1">Skeleton Text</h1>

    <p class="text-500">neutral text</p>
    <p class="text-primary-500">primary text</p>
    <p class="text-secondary-500">secondary text</p>
    <p class="text-tertiary-900">tertiary text</p>
    <p class="text-warning-500">warning text</p>
    <p class="text-error-900">error text</p>

    <h1 class="h1">Skeleton Buttons</h1>
    <!-- https://www.skeleton.dev/elements/buttons -->
    <button class="btn">default</button>
    <button class="btn variant-filled">neutral</button>
    <button class="btn btn-sm variant-filled rounded">sm neutral rectangle</button>
    <button class="btn btn-sm variant-filled">sm neutral</button>
    <button class="btn btn-sm variant-filled-success">sm success</button>
    <button class="btn btn-sm variant-filled-primary">sm primary</button>
    <button class="btn variant-filled-secondary">md secondary</button>
    <button class="btn btn-lg variant-filled-tertiary">lg tertiary</button>
    <button class="btn btn-xl variant-filled-warning">xl warning</button>

    <h1 class="h1">Pyro Buttons</h1>

    <.button variant="default">default</.button>
    <.button color="neutral">neutral</.button>
    <.button shape="rectangle" size="sm" color="neutral">sm neutral rectangle</.button>
    <.button size="sm" color="neutral">sm neutral</.button>
    <.button size="sm" color="success">sm success</.button>
    <.button size="sm" color="primary">sm primary</.button>
    <.button color="secondary">md secondary</.button>
    <.button color="tertiary" size="lg">lg tertiary</.button>
    <.button color="warning" size="xl">xl warning</.button>
    """
  end
end
