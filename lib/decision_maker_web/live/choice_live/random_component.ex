defmodule DecisionMakerWeb.ChoiceLive.RandomComponent do
  use DecisionMakerWeb, :live_component


  def render(assigns) do
    
    ~H"""
    <div>
      <.button phx-click="random_updated"> Random Button</.button>
      <p>This is a random component</p>
      <p><%= @randoms %></p>
    </div>
    """
  end
end
