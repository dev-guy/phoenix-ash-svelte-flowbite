defmodule MyApp.Organization do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    ...

    manage_tenant do
      template ["org_", :id]
    end
  end
end
