defmodule EarmarkDingus2.Api do 
  
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  get "/alive" do 
    conn
    |> send_resp( 200, ~s[{"alive": true, "server-version": "2.2.0"}] )
    |> halt()
  end

  get "/" do 
    conn = Plug.Conn.fetch_query_params(conn)
    {code, response} = EarmarkDingus2.Convert.convert(conn.params)
    IO.inspect response
    conn
    |> send_resp(code, Poison.encode!(response))
    |> halt()
  end

  get _ do
    send_resp( conn, 400, "huh" )
  end

end
