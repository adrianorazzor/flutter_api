defmodule FlutterApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :pessoa_id, :integer

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
