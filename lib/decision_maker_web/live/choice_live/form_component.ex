defmodule DecisionMakerWeb.ChoiceLive.FormComponent do
  use DecisionMakerWeb, :live_component

  alias DecisionMaker.ChoiceTable

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage choice records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="choice-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :username}} type="text" label="username" />
        <.input field={{f, :body}} type="text" label="body" />
        <.input field={{f, :weight}} type="number" label="weight" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Choice</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{choice: choice} = assigns, socket) do
    changeset = ChoiceTable.change_choice(choice)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"choice" => choice_params}, socket) do
    changeset =
      socket.assigns.choice
      |> ChoiceTable.change_choice(choice_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"choice" => choice_params}, socket) do
    save_choice(socket, socket.assigns.action, choice_params)
  end

  defp save_choice(socket, :edit, choice_params) do
    case ChoiceTable.update_choice(socket.assigns.choice, choice_params) do
      {:ok, _choice} ->
        {:noreply,
         socket
         |> put_flash(:info, "Choice updated successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_choice(socket, :new, choice_params) do
    case ChoiceTable.create_choice(choice_params) do
      {:ok, _choice} ->
        {:noreply,
         socket
         |> put_flash(:info, "Choice created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
