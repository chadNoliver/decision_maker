defmodule DecisionMakerWeb.ChoiceLive.Index do
  use DecisionMakerWeb, :live_view

  alias DecisionMaker.ChoiceTable
  alias DecisionMaker.ChoiceTable.Choice

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: ChoiceTable.subscribe()
    {:ok, assign(socket, :choices, list_choices())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Choice")
    |> assign(:choice, ChoiceTable.get_choice!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Choice")
    |> assign(:choice, %Choice{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Choices")
    |> assign(:choice, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    choice = ChoiceTable.get_choice!(id)
    {:ok, _} = ChoiceTable.delete_choice(choice)

    {:noreply, assign(socket, :choices, list_choices())}
  end

@impl true
def handle_info({choice_created, choice}, socket) do
  {:noreply, update(socket, :choices, fn choices -> [choice | choices] end)}
end

  defp list_choices do
    ChoiceTable.list_choices()
  end
end
