defmodule EarmarkDingus2.Web do

  def start_link do
    port = System.get_env("PORT") |> String.to_integer
    Plug.Adapters.Cowboy.http(EarmarkDingus2.Api, [], port: port)
  end
end
