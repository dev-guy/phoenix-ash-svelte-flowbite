defmodule Kantan.Repo.Migrations.AddUsernameToUsers do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:users) do
      add :username, :text, null: false
    end
  end

  def down do
    alter table(:users) do
      remove :username
    end
  end
end