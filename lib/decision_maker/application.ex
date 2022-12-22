defmodule DecisionMaker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DecisionMakerWeb.Telemetry,
      # Start the Ecto repository
      DecisionMaker.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DecisionMaker.PubSub},
      # Start Finch
      {Finch, name: DecisionMaker.Finch},
      # Start the Endpoint (http/https)
      DecisionMakerWeb.Endpoint,
      # Start a worker by calling: DecisionMaker.Worker.start_link(arg)
      # {DecisionMaker.Worker, arg}
      DecisionMakerWeb.Presence
     ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DecisionMaker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DecisionMakerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
