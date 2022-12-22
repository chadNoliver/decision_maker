defmodule DecisionMakerWeb.ChoiceLive.RandomComponent do
  use DecisionMakerWeb, :live_component

  def animate_random(element_id) do
    JS.transition(%JS{}, "animate-spin", to: element_id, time: 5000)
  end

  def render(assigns) do
    
    ~H"""
    <div>
      <.button phx-click="random_updated"> Random Button</.button>
      <div>Random Selection: 
        <div id="randoms-show" data-spin={animate_random("#randoms-show")}><%= @randoms %></div>
      </div>
    </div>
    """
  end
end
