defmodule KantanWeb.Svelte.Navigation do
  use KantanWeb, :html
  import LiveSvelte

  def render(assigns) do
    ~V"""
    <a href="/" ><button class='btn btn-sm variant-filled'> Back </button></a>
    <a href="/" data-phx-link="redirect" data-phx-link-state="push"><button class='btn btn-sm variant-filled'> Redirect Back </button></a>
    <button type='button' href="/" data-phx-link="redirect" data-phx-link-state="push"  class='btn btn-sm variant-filled'> Redirect 2 </button>
    """
  end
end
