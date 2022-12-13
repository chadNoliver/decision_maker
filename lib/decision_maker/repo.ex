defmodule DecisionMaker.Repo do
  use Ecto.Repo,
    otp_app: :decision_maker,
    adapter: Ecto.Adapters.Postgres
end
