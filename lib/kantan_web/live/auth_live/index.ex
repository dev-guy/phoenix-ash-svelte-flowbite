defmodule KantanWeb.AuthLive.Index do
  use KantanWeb, :live_view

  alias Kantan.Accounts
  alias Kantan.Accounts.User
  alias AshPhoenix.Form

  @impl true
  def mount(_, _, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :register, _params) do
    socket
    |> assign(:form_id, "sign-up-form")
    |> assign(:cta, "Sign up")
    |> assign(:alternative_path, ~p"/sign-in")
    |> assign(:alternative, "Have an account?")
    |> assign(:action, ~p"/auth/user/password/register")
    |> assign(
      :form,
      Form.for_create(User, :register_with_password, api: Accounts, as: "user")
    )
  end

  defp apply_action(socket, :sign_in, _params) do
    socket
    |> assign(:form_id, "sign-in-form")
    |> assign(:cta, "Sign in")
    |> assign(:alternative_path, ~p"/register")
    |> assign(:alternative, "Need an account?")
    |> assign(:action, ~p"/auth/user/password/sign_in")
    |> assign(
      :form,
      Form.for_action(User, :sign_in_with_password, api: Accounts, as: "user")
    )
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="auth-page">
      <div class="container page">
        <div class="row">
          <div class="col-md-6 offset-md-3 col-xs-12">
            <h1 class="text-xs-center"><%= @cta %></h1>
            <p class="text-xs-center">
              <a href={@alternative_path}>
                <.button><%= @alternative %></.button>
              </a>
            </p>

            <.live_component
              module={KantanWeb.AuthLive.AuthForm}
              id={@form_id}
              form={@form}
              is_register?={@live_action == :register}
              action={@action}
              cta={@cta}
            />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
