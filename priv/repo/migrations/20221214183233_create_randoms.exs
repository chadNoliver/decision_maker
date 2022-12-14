defmodule DecisionMaker.Repo.Migrations.CreateRandoms do
  use Ecto.Migration

  def change do
    create table(:randoms) do
      add :username, :string
      add :randomnum, :integer

      timestamps()
    end
  end
end
