defmodule Kantan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {NodeJS.Supervisor, [path: Application.app_dir(:kantan, "/priv/static/assets"), pool_size: 4]},
      # Start the Telemetry supervisor
      KantanWeb.Telemetry,
      # Start the Ecto repository
      Kantan.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Kantan.PubSub},
      # Start Finch
      {Finch, name: Kantan.Finch},
      # Start the Endpoint (http/https)
      KantanWeb.Endpoint,
      # Start a worker by calling: Kantan.Worker.start_link(arg)
      # {Kantan.Worker, arg}
      {AshAuthentication.Supervisor, otp_app: :kantan}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kantan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KantanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
