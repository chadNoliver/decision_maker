defmodule DecisionMakerWeb.RestaurantsLive.Show do
  use DecisionMakerWeb, :live_view

  alias DecisionMaker.Restaurant

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:restaurants, Restaurant.get_restaurants!(id))}
  end

  defp page_title(:show), do: "Show Restaurants"
  defp page_title(:edit), do: "Edit Restaurants"
end
