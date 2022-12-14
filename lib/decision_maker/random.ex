defmodule DecisionMaker.Random do
  use Ecto.Schema
  import Ecto.Changeset

  schema "randoms" do
    field :randomnum, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(random, attrs) do
    random
    |> cast(attrs, [:username, :randomnum])
    |> validate_required([:username, :randomnum])
  end
end
