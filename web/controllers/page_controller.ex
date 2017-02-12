defmodule EarmarkDingus2.PageController do
  use EarmarkDingus2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
