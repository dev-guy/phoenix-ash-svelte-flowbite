defmodule KantanWeb.SvelteComponents do
  use KantanWeb, :live_view

  def render(assigns) do
    ~H"""
    <LiveSvelte.render ssr={false} name="Components" props={%{}} />
    """
  end
end
