defmodule PurnamAuth.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :admin, :string
    end

  end
end
