defmodule DecisionMaker.RestaurantTest do
  use DecisionMaker.DataCase

  alias DecisionMaker.Restaurant

  describe "restaurants" do
    alias DecisionMaker.Restaurant.Restaurants

    import DecisionMaker.RestaurantFixtures

    @invalid_attrs %{name: nil}

    test "list_restaurants/0 returns all restaurants" do
      restaurants = restaurants_fixture()
      assert Restaurant.list_restaurants() == [restaurants]
    end

    test "get_restaurants!/1 returns the restaurants with given id" do
      restaurants = restaurants_fixture()
      assert Restaurant.get_restaurants!(restaurants.id) == restaurants
    end

    test "create_restaurants/1 with valid data creates a restaurants" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Restaurants{} = restaurants} = Restaurant.create_restaurants(valid_attrs)
      assert restaurants.name == "some name"
    end

    test "create_restaurants/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Restaurant.create_restaurants(@invalid_attrs)
    end

    test "update_restaurants/2 with valid data updates the restaurants" do
      restaurants = restaurants_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Restaurants{} = restaurants} = Restaurant.update_restaurants(restaurants, update_attrs)
      assert restaurants.name == "some updated name"
    end

    test "update_restaurants/2 with invalid data returns error changeset" do
      restaurants = restaurants_fixture()
      assert {:error, %Ecto.Changeset{}} = Restaurant.update_restaurants(restaurants, @invalid_attrs)
      assert restaurants == Restaurant.get_restaurants!(restaurants.id)
    end

    test "delete_restaurants/1 deletes the restaurants" do
      restaurants = restaurants_fixture()
      assert {:ok, %Restaurants{}} = Restaurant.delete_restaurants(restaurants)
      assert_raise Ecto.NoResultsError, fn -> Restaurant.get_restaurants!(restaurants.id) end
    end

    test "change_restaurants/1 returns a restaurants changeset" do
      restaurants = restaurants_fixture()
      assert %Ecto.Changeset{} = Restaurant.change_restaurants(restaurants)
    end
  end
end
