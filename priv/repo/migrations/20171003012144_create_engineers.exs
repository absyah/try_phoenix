defmodule TryPhoenix.Repo.Migrations.CreateEngineers do
  use Ecto.Migration

  def change do
    create table(:engineers) do
      add :name, :string
      add :email, :string
      add :phone, :string

      timestamps()
    end
  end
end
