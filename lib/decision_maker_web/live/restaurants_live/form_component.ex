defmodule DecisionMakerWeb.RestaurantsLive.FormComponent do
  use DecisionMakerWeb, :live_component

  alias DecisionMaker.Restaurant

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage restaurants records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="restaurants-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :name}} type="text" label="name" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Restaurants</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{restaurants: restaurants} = assigns, socket) do
    changeset = Restaurant.change_restaurants(restaurants)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"restaurants" => restaurants_params}, socket) do
    changeset =
      socket.assigns.restaurants
      |> Restaurant.change_restaurants(restaurants_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"restaurants" => restaurants_params}, socket) do
    save_restaurants(socket, socket.assigns.action, restaurants_params)
  end

  defp save_restaurants(socket, :edit, restaurants_params) do
    case Restaurant.update_restaurants(socket.assigns.restaurants, restaurants_params) do
      {:ok, _restaurants} ->
        {:noreply,
         socket
         |> put_flash(:info, "Restaurants updated successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_restaurants(socket, :new, restaurants_params) do
    case Restaurant.create_restaurants(restaurants_params) do
      {:ok, _restaurants} ->
        {:noreply,
         socket
         |> put_flash(:info, "Restaurants created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
