defmodule DecisionMakerWeb.RoomChannel do
  use DecisionMakerWeb, :channel
  alias DecisionMakerWeb.Presence
  
  # @impl true
  # def join("room:lobby", socket) do
  #     {:ok, socket}
  # end

  @impl true
  def join("room:lobby", %{}, socket) do
    # if authorized?(payload) do
      name = MnemonicSlugs.generate_slug(2)
      send(self(), :after_join)
      {:ok, assign(socket, :name, name)}
    # else
      # {:error, %{reason: "unauthorized"}}
    # end
  end

  # @impl true
  # def join("room:42", payload, socket) do
  #   if authorized?(payload) do
  #     {:ok, socket}
  #   else
  #     {:error, %{reason: "unauthorized"}}
  #   end
  # end



  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end

  def handle_info(:after_join, socket) do
    {:ok, _} =
      Presence.track(socket, socket.assigns.name, %{
        online_at: inspect(System.system_time(:second))
      })
    push(socket, "presence_state", Presence.list(socket))
    {:noreply, socket}
  end
end
