defmodule DecisionMaker.Restaurant do
  @moduledoc """
  The Restaurant context.
  """

  import Ecto.Query, warn: false
  alias DecisionMaker.Repo

  alias DecisionMaker.Restaurant.Restaurants

  @doc """
  Returns the list of restaurants.

  ## Examples

      iex> list_restaurants()
      [%Restaurants{}, ...]

  """
  def list_restaurants do
    Repo.all(Restaurants)
  end

  @doc """
  Gets a single restaurants.

  Raises `Ecto.NoResultsError` if the Restaurants does not exist.

  ## Examples

      iex> get_restaurants!(123)
      %Restaurants{}

      iex> get_restaurants!(456)
      ** (Ecto.NoResultsError)

  """
  def get_restaurants!(id), do: Repo.get!(Restaurants, id)

  @doc """
  Creates a restaurants.

  ## Examples

      iex> create_restaurants(%{field: value})
      {:ok, %Restaurants{}}

      iex> create_restaurants(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_restaurants(attrs \\ %{}) do
    %Restaurants{}
    |> Restaurants.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a restaurants.

  ## Examples

      iex> update_restaurants(restaurants, %{field: new_value})
      {:ok, %Restaurants{}}

      iex> update_restaurants(restaurants, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_restaurants(%Restaurants{} = restaurants, attrs) do
    restaurants
    |> Restaurants.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a restaurants.

  ## Examples

      iex> delete_restaurants(restaurants)
      {:ok, %Restaurants{}}

      iex> delete_restaurants(restaurants)
      {:error, %Ecto.Changeset{}}

  """
  def delete_restaurants(%Restaurants{} = restaurants) do
    Repo.delete(restaurants)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking restaurants changes.

  ## Examples

      iex> change_restaurants(restaurants)
      %Ecto.Changeset{data: %Restaurants{}}

  """
  def change_restaurants(%Restaurants{} = restaurants, attrs \\ %{}) do
    Restaurants.changeset(restaurants, attrs)
  end
end
