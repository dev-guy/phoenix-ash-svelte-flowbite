defmodule Kantan.Organizations.Organization do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

    attributes do
      uuid_primary_key :id
      attribute :name, :string, allow_nil?: false
    end

    postgres do
      table "organization"
      repo Kantan.Repo
    end

    identities do
      identity :unique_name, [:name]
    end

    manage_tenant do
      template ["org_", :id]
    end
  end
end
