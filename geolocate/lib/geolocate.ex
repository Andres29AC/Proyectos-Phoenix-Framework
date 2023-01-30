defmodule Geolocate do
  #Cosas por cambiar del codigo:
  #url escrita en el modulo principal
  #separar la api key
  #dependencias explicitamente invocadas
  #@uri "http://api.ipstack.com/"
  def get(ip) when is_binary(ip) do
    Geolocate.Locate.locate(ip)
  end

end
