defmodule Kantan.Accounts.User do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication]

  attributes do
    uuid_primary_key :id
    attribute :email, :ci_string, allow_nil?: false
    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true
    attribute(:username, :string, allow_nil?: false)
  end

  authentication do
    api Kantan.Accounts

    strategies do
      password :password do
        identity_field(:email)
        sign_in_tokens_enabled?(true)
        register_action_accept([:username])
      end
    end

    tokens do
      enabled?(true)
      token_resource(Kantan.Accounts.Token)

      signing_secret(Application.compile_env(:kantan, KantanWeb.Endpoint)[:secret_key_base])
    end
  end

  postgres do
    table "users"
    repo Kantan.Repo
  end

  identities do
    identity :unique_email, [:email]
  end

  # If using policies, add the following bypass:
  # policies do
  #   bypass AshAuthentication.Checks.AshAuthenticationInteraction do
  #     authorize_if always()
  #   end
  # end
end
