defmodule Kantan.Organizations do
  use Ash.Api

  resources do
    registry Kantan.Accounts.Registry
  end
end
