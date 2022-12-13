defmodule DecisionMaker.Repo.Migrations.CreateChoices do
  use Ecto.Migration

  def change do
    create table(:choices) do
      add :username, :string
      add :body, :string
      add :weight, :integer

      timestamps()
    end
  end
end
