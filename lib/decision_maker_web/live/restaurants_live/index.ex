defmodule DecisionMakerWeb.RestaurantsLive.Index do
  use DecisionMakerWeb, :live_view

  alias DecisionMaker.Restaurant
  alias DecisionMaker.Restaurant.Restaurants

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :restaurants_collection, list_restaurants())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Restaurants")
    |> assign(:restaurants, Restaurant.get_restaurants!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Restaurants")
    |> assign(:restaurants, %Restaurants{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Restaurants")
    |> assign(:restaurants, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    restaurants = Restaurant.get_restaurants!(id)
    {:ok, _} = Restaurant.delete_restaurants(restaurants)

    {:noreply, assign(socket, :restaurants_collection, list_restaurants())}
  end

  defp list_restaurants do
    Restaurant.list_restaurants()
  end
end
