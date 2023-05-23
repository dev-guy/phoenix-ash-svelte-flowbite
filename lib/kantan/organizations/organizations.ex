defmodule Kantan.Organizations do
  use Ash.Api

  resources do
    registry Kantan.Organizations.Registry
  end
end
