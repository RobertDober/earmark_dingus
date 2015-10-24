defmodule EarmarkDingus.PageController do
  use EarmarkDingus.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
