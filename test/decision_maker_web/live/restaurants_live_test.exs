defmodule DecisionMakerWeb.RestaurantsLiveTest do
  use DecisionMakerWeb.ConnCase

  import Phoenix.LiveViewTest
  import DecisionMaker.RestaurantFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_restaurants(_) do
    restaurants = restaurants_fixture()
    %{restaurants: restaurants}
  end

  describe "Index" do
    setup [:create_restaurants]

    test "lists all restaurants", %{conn: conn, restaurants: restaurants} do
      {:ok, _index_live, html} = live(conn, ~p"/restaurants")

      assert html =~ "Listing Restaurants"
      assert html =~ restaurants.name
    end

    test "saves new restaurants", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/restaurants")

      assert index_live |> element("a", "New Restaurants") |> render_click() =~
               "New Restaurants"

      assert_patch(index_live, ~p"/restaurants/new")

      assert index_live
             |> form("#restaurants-form", restaurants: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#restaurants-form", restaurants: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/restaurants")

      assert html =~ "Restaurants created successfully"
      assert html =~ "some name"
    end

    test "updates restaurants in listing", %{conn: conn, restaurants: restaurants} do
      {:ok, index_live, _html} = live(conn, ~p"/restaurants")

      assert index_live |> element("#restaurants-#{restaurants.id} a", "Edit") |> render_click() =~
               "Edit Restaurants"

      assert_patch(index_live, ~p"/restaurants/#{restaurants}/edit")

      assert index_live
             |> form("#restaurants-form", restaurants: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#restaurants-form", restaurants: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/restaurants")

      assert html =~ "Restaurants updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes restaurants in listing", %{conn: conn, restaurants: restaurants} do
      {:ok, index_live, _html} = live(conn, ~p"/restaurants")

      assert index_live |> element("#restaurants-#{restaurants.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#restaurants-#{restaurants.id}")
    end
  end

  describe "Show" do
    setup [:create_restaurants]

    test "displays restaurants", %{conn: conn, restaurants: restaurants} do
      {:ok, _show_live, html} = live(conn, ~p"/restaurants/#{restaurants}")

      assert html =~ "Show Restaurants"
      assert html =~ restaurants.name
    end

    test "updates restaurants within modal", %{conn: conn, restaurants: restaurants} do
      {:ok, show_live, _html} = live(conn, ~p"/restaurants/#{restaurants}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Restaurants"

      assert_patch(show_live, ~p"/restaurants/#{restaurants}/show/edit")

      assert show_live
             |> form("#restaurants-form", restaurants: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#restaurants-form", restaurants: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/restaurants/#{restaurants}")

      assert html =~ "Restaurants updated successfully"
      assert html =~ "some updated name"
    end
  end
end
