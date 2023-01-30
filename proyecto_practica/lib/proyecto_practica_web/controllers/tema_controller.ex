defmodule ProyectoPracticaWeb.TemaController do
  use ProyectoPracticaWeb, :controller
  alias ProyectoPracticaWeb.Tema
  def new(conn,params) do
    # struct = %Tema{}
    # params = %{}
    changeset = Tema.changeset(%Tema{}, %{})
   end
end 
