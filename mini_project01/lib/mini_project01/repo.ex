defmodule MiniProject01.Repo do
  use Ecto.Repo,
    otp_app: :mini_project01,
    adapter: Ecto.Adapters.Postgres
end
