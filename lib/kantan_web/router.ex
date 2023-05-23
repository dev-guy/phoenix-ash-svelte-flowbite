defmodule KantanWeb.Router do
  use KantanWeb, :router
  use AshAuthentication.Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {KantanWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :load_from_session
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :load_from_bearer
  end

  scope "/", KantanWeb do
    pipe_through :browser

    # First test
    get "/healthcheck", PageController, :healthcheck

    # Svelte dead views
    get "/svelte/timeline", PageController, :timeline
    get "/svelte/tiptap", PageController, :tiptap
    get "/svelte/mermaid", PageController, :mermaid

    ash_authentication_live_session :authentication_optional,
      on_mount: {KantanWeb.LiveUserAuth, :live_user_optional} do
      live "/", Live.Index, :index
      live "/svelte/counter", Svelte.Counter
      live "/svelte/navigationExample", Svelte.NavigationExample

    end

    # live "/register", AuthLive.Index, :register
    # live "/sign-in", AuthLive.Index, :sign_in

    sign_in_route()
    sign_out_route AuthController
    auth_routes_for Kantan.Accounts.User, to: AuthController
    reset_route []
  end

  # Other scopes may use custom stacks.
  # scope "/api", KantanWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kantan, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: KantanWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
