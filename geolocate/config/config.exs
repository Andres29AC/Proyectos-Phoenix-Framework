defmodule Geolocate.Config do
  import Mix.Config


  config :geolocate, :http_client, PoisonClient
  config :geolocate, :apikey, File.read!(".env") |> String.trim()
  #pondremos el decoder pero no es necesario lo pondremos para enseñar mejor
  config :geolocate, :decoder,Jason

end
