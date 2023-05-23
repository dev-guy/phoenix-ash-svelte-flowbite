defmodule Kantan.Organizations.Registry do
  use Ash.Registry, extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry Kantan.Organizations.Organization
  end
end
