defmodule KantanWeb.PageController do
  use KantanWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def svelte(conn, _params), do: render(conn, :svelte)
end
