defmodule KantanWeb.Svelte.NavigationExample do
  use KantanWeb, :live_view

  def render(assigns) do
    ~V"""
    <a href="/" data-phx-link="redirect" data-phx-link-state="push"><button class="btn btn-sm variant-filled">Redirect<button></a>
    <a href="/" data-phx-link="patch" data-phx-link-state="push"><button>Patch<button></a>
    """
  end
end
