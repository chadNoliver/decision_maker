defmodule DecisionMakerWeb.ChoiceLive.CurrentUsersComponent do
  use DecisionMakerWeb, :live_component

  def render(assigns) do
    
    ~H"""
    <div>
      <div>Current Users</div>
        <.table id="users" rows={@users} >
        <:col :let={user} label="Username"><%= user.username %></:col>
        </.table>
    </div>
    """
  end
end
