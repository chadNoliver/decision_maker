defmodule DecisionMakerWeb.ChoiceLive.Index do
  use DecisionMakerWeb, :live_view
  alias DecisionMaker.ChoiceTable
  alias DecisionMaker.ChoiceTable.Choice

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: ChoiceTable.subscribe()
    if connected?(socket), do: Phoenix.PubSub.subscribe(DecisionMaker.PubSub,"random_updated")
    {:ok, socket
    |> assign(:choices, list_choices())
    |> assign(:randoms, list_randoms())
    }
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

    {:noreply, socket}
  end

  def handle_event("random_updated", _value, socket) do
    new_random = Enum.random(0..99)
    broadcast_random(new_random)
    {:noreply, assign(socket, :randoms, new_random)}
  end


  @impl true
  def handle_info({:choice_created, choice}, socket) do
    {:noreply, update(socket, :choices, fn choices -> [choice | choices] end)}
  end

  def handle_info({:choice_deleted, choice}, socket) do
    {:noreply, update(socket, :choices, fn choices -> choices -- [choice] end)}
  end

  def handle_info({:choice_updated, _choice}, socket) do
    {:noreply, assign(socket, :choices, list_choices())}
  end

  def handle_info({:random_updated, random}, socket) do
    {:noreply, assign(socket, :randoms, random )}
  end

  defp broadcast_random(random) do
    Phoenix.PubSub.broadcast(DecisionMaker.PubSub, "random_updated", {:random_updated, random})
  end

  defp list_choices do
    ChoiceTable.list_choices()
  end

  defp list_randoms do
    if (:randoms == nil) do
      {" "}
    end

    unless (:randoms != nil) do
      { :randoms }
    end
  end

end
