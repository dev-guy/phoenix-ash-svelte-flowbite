defmodule KantanWeb.PageController do
  use KantanWeb, :controller

  def healthcheck(conn, _params), do: render(conn, :healthcheck)
  def kanban(conn, _params), do: render(conn, :kanban)
  def mermaid(conn, _params), do: render(conn, :mermaid)
  def milkdown(conn, _params), do: render(conn, :milkdown)
  def timeline(conn, _params), do: render(conn, :timeline)
  def tiptap(conn, _params), do: render(conn, :tiptap)
  def ycounter(conn, _params), do: render(conn, :ycounter)
end
