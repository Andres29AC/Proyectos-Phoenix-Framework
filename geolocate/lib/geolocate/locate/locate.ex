defmodule Geolocate.Locate do
  @uri "http://api.ipstack.com/"

  def locate(ip) when is_binary(ip) do
    {client, apikey, decoder}=load_env()
    query = "#{@uri}#{ip}?access_key=#{apikey}"
    query
    |> client.get()
    |> decoder.decode!

  end
  defp load_env do
    client = Application.get_env(:geolocate, :http_client)
    apikey = Application.get_env(:geolocate, :apikey)
    decoder = Application.get_env(:geolocate, :decoder)
    #como habiamos visto para devolver varios valores los devolvemos
    #dentro de una tupla
    {client, apikey, decoder}

  end

end
