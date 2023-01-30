defmodule JuegoLogicaWeb.PageController do
  use JuegoLogicaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
