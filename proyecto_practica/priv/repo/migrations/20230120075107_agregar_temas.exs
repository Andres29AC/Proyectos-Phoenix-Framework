defmodule ProyectoPractica.Repo.Migrations.AgregarTemas do
  use Ecto.Migration

  def change do
    create table(:temas) do
      add :titulo, :string
    end 
  end
end
