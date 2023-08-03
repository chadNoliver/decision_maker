defmodule DecisionMaker.Restaurant.Restaurants do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(restaurants, attrs) do
    restaurants
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
