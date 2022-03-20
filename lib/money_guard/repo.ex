defmodule MoneyGuard.Repo do
  use Ecto.Repo,
    otp_app: :money_guard,
    adapter: Ecto.Adapters.Postgres
end
