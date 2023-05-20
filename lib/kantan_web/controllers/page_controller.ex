defmodule KantanWeb.PageController do
  use KantanWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home)
  end

  def app_shell(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :app_shell, layout: false)
  end

  def skeleton(conn, _params), do: render(conn, :skeleton)
  def tiptap(conn, _params), do: render(conn, :tiptap)
  def mermaid(conn, _params), do: render(conn, :mermaid)
end
