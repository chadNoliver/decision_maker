defmodule DecisionMakerWeb.ChoiceLive.Show do
  use DecisionMakerWeb, :live_view

  alias DecisionMaker.ChoiceTable

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:choice, ChoiceTable.get_choice!(id))}
  end

  defp page_title(:show), do: "Show Choice"
  defp page_title(:edit), do: "Edit Choice"
end
