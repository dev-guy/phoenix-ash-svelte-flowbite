defmodule KantanWeb.Svelte.Timeline do
  use KantanWeb, :live_view

  def render(assigns) do
    ~H"""
    <.Timeline toastName="this is some toast">
    <!-- Slots + LiveSvelte is not supported yet, but it works

  Elixir outputs a warning during compilation.
   -->
  <:toast>
  <div class='flex' align-items>

  <.button color='error'>
  <.icon name='hero-exclamation-triangle'/>How about some toast?
  </.button>
  </div>
  </:toast>
    </.Timeline>
    """
  end
end
