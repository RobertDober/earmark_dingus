defmodule EarmarkDingus.PageControllerTest do
  use EarmarkDingus.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert json_response(conn, 412) == %{"error_message" => "text parameter of max length 1000 missing"} 
  end
end
