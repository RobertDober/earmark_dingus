defmodule EarmarkDingus.EarmarkController do
  use EarmarkDingus.Web, :controller

  @allowed_input_length 1000

  def show conn, %{"text" => text} do 
  if String.length(text) <= @allowed_input_length  do
    show_result conn, text
  else
    conn
    |> put_status( 412 )
    |> json( %{error_message: "text parameter exceeds authorized length of #{@allowed_input_length}"} )
  end
  end

  def show conn, _params do
    conn
    |> put_status( 412 )
    |> json( %{error_message: "text parameter of max length #{@allowed_input_length} missing"} )
  end

  def alive conn, _params do
    json( conn, %{message: "alive"} )
  end

  defp show_result conn, text do
    {:ok, version} = :application.get_key( :earmark, :vsn)
    conn
    |> json(%{
      name: "Earmark",
      version: "#{version}",
      html: Earmark.to_html( text ),
      author: "Dave Thomas",
      website: "https://github.com/pragdave/earmark"
    })
  end
end
