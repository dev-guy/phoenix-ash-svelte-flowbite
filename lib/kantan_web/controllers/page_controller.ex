defmodule KantanWeb.PageController do
  use KantanWeb, :controller

  def timeline(conn, _params), do: render(conn, :timeline)
  def tiptap(conn, _params), do: render(conn, :tiptap)
  def mermaid(conn, _params), do: render(conn, :mermaid)
end
