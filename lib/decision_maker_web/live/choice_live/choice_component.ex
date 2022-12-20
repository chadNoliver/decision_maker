defmodule DecisionMakerWeb.ChoiceLive.ChoiceComponent do
  use DecisionMakerWeb, :live_component
  
  def render(assigns) do
    ~H"""
    <div>
      <.table id="choices" rows={@choices} row_click={&JS.navigate(~p"/choices/#{&1}")}>
        <:col :let={choice} label="Username"><%= choice.username %></:col>
        <:col :let={choice} label="Body"><%= choice.body %></:col>
        <:col :let={choice} label="Weight"><%= choice.weight %></:col>
        <:action :let={choice}>
          <div class="sr-only">
            <.link navigate={~p"/choices/#{choice}"}>Show</.link>
          </div>
          <.link patch={~p"/choices/#{choice}/edit"}>Edit</.link>
        </:action>
        <:action :let={choice}>
          <.link phx-click={JS.push("delete", value: %{id: choice.id})} data-confirm="Are you sure?">
            Delete
          </.link>
        </:action>
      </.table>
    </div>
    """
  end
end

