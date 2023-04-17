defmodule Kantan.Accounts.Registry do
  use Ash.Registry, extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry Kantan.Accounts.Tenant
    entry Kantan.Accounts.User
    entry Kantan.Accounts.Token
  end
end
