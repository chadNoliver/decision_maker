defmodule DecisionMaker.RestaurantFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DecisionMaker.Restaurant` context.
  """

  @doc """
  Generate a restaurants.
  """
  def restaurants_fixture(attrs \\ %{}) do
    {:ok, restaurants} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> DecisionMaker.Restaurant.create_restaurants()

    restaurants
  end
end
