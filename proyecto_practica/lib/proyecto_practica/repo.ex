defmodule ProyectoPractica.Repo do
  use Ecto.Repo,
    otp_app: :proyecto_practica,
    adapter: Ecto.Adapters.Postgres
end
