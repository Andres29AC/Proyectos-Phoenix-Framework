defmodule JuegoLogicaWeb.Tablero do
  use JuegoLogicaWeb, :live_view
  def mount(_params, _session, socket) do
    grid = for  x <- 0..4, y <- 0..4, into: %{}, do: { {x, y}, false }
    level = %{{2,0} => true ,{2,2}  => true ,{2,4} => true}
    grid = Map.merge(grid, level)
   {:ok, assign(socket, grid: grid,win: false)}
  end
  def handle_event("toggle", %{"x" => strX, "y" => strY}, socket) do
    grid = socket.assigns.grid
    grid_x = String.to_integer(strX)
    grid_y = String.to_integer(strY)
    updated_grid = 
      find_adjacent_tiles(grid_x,grid_y)
      |> Enum.reduce(%{}, fn point, acc ->
        Map.put(acc, point, !grid[point])
      end)
      |> then(fn toggled_grid -> Map.merge(grid,toggled_grid)end)
    win=comprobar_victoria(updated_grid)
    socket = assign(socket, grid: updated_grid,win: win)
    case win do
      true -> {:noreply,push_event(socket, "perdiste", %{win: win})}
       _  -> {:noreply, socket}
    end
    # {:noreply, assign(socket, grid: updated_grid,win: win)}
  end
  defp find_adjacent_tiles(x,y) do
    prevX = Kernel.max(0, x - 1)
    nextX = Kernel.min(4, x + 1)
    prevY = Kernel.max(0, y - 1)
    nextY = Kernel.min(4, y + 1)
    [{x,y},{prevX,y},{nextX,y},{x,prevY},{x,nextY}]
  end 
  defp comprobar_victoria(grid) do
    grid
    |> Map.values()
    |> Enum.all?(&(!&1))
  end
end



#Explicacion: la funcion mount recibe 3 parametros, los cuales son los siguientes:
#_params: son los parametros que se le pasan a la vista, en este caso no se le pasan parametros
#_session: es la sesion del usuario, en este caso no se usa
#socket: es el socket de la vista, en este caso se le asigna el grid a la vista
#La funcion mount retorna un socket con el grid asignado
#La funcion mount se ejecuta cuando se carga la vista

