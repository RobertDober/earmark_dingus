defmodule EarmarkDingus12Web.PageController do
  use EarmarkDingus12Web, :controller

  def index(conn, _params) do
    text = Plug.Conn.Query.decode(conn.query_string)["text"]
    resp = EarmarkDingus12.Earmark.convert_to_response(text)
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

  def version(conn, _params) do
    conn
      |> send_resp(200, Earmark.version() |> to_string())
  end
end
