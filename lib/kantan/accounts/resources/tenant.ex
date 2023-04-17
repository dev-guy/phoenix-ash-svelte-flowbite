defmodule Kantan.Accounts.Tenant do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  attributes do
    uuid_primary_key :id
    attribute :name, :string
    attribute :slug, :string
  end

  identities do
    identity :unique_name, [:name]
    identity :unique_name, [:slug]
  end

  postgres do
    manage_tenant do
      template ["tenant_", :id]
    end
    table "tenants"
    repo Kantan.Repo
  end
end
