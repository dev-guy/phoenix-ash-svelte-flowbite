defmodule Kantan.Repo do
  use AshPostgres.Repo, otp_app: :kantan

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
