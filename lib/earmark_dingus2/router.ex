defmodule EarmarkDingus2.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/alive" do 
    send_resp( conn, 200, ~s[{"alive": true, "server-version": "2.2.0"}] )
  end

  get "/" do 
    send_resp( conn, 200, ~s[{"error": "not yet implemented", "server-version": "2.2.0"}] )
  end

  get _ do
    send_resp( conn, 400, "huh" )
  end

  def start_link do
    Plug.Adapters.Cowboy.http(EarmarkDingus2.Router, [])
  end
end
