defmodule DecisionMaker.ChoiceTable.Choice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "choices" do
    field :body, :string
    field :username, :string
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(choice, attrs) do
    choice
    |> cast(attrs, [:username, :body, :weight])
    |> validate_required([:username, :body, :weight])
  end
end
