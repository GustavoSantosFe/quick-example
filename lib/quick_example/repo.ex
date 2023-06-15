defmodule QuickExample.Repo do
  use Ecto.Repo,
    otp_app: :quick_example,
    adapter: Ecto.Adapters.Postgres
end
