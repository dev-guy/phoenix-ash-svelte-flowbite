defmodule KantanWeb.Svelte.Counter do
  use KantanWeb, :live_view

  def render(assigns) do
    ~H"""
    <LiveSvelte.render name="Counter" ssr={false} props={%{number: @number}} />
    """
  end

  def handle_event("set_number", %{"number" => number}, socket) do
    {:noreply, assign(socket, :number, number)}
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :number, 0)}
  end
end
