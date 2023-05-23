defmodule KantanWeb.PageController do
  use KantanWeb, :controller

  def healthcheck(conn, _params), do: render(conn, :healthcheck)
  def mermaid(conn, _params), do: render(conn, :mermaid)
  def timeline(conn, _params), do: render(conn, :timeline)
  def tiptap(conn, _params), do: render(conn, :tiptap)
end
