defmodule Websvc.Web do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Websvc.Web, []
  end

  get "/version" do
    conn
      |> send_resp(200, Earmark.version() |> to_string())
  end

  get "/" do
    text = Plug.Conn.Query.decode(conn.query_string)["text"]
    resp = Websvc.Earmark.convert_to_response(text)
    # IO.inspect(resp)
    case Poison.encode(resp) do 
      {:ok, encoded} -> conn
        |> send_resp(200, encoded)
        |> halt
        _            -> conn
        |> send_resp(400, "internal error")
        |> halt
    end
  end

  match _ do  
    conn
    |> send_resp(404, "Nothing here")
    |> halt
  end
end
