defmodule Kantan.Accounts do
  use Ash.Api

  resources do
    registry Kantan.Accounts.Registry
  end
end
