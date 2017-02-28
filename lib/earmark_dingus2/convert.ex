defmodule EarmarkDingus2.Convert do
  
  @max_authorized 1000

  def convert(params) 
  def convert(%{"text" => text}) do 
   if String.length(text) > @max_authorized do
     {400, _aug(%{error_message: "`text' query parameter too long (max #{@max_authorized}"})}
    else
      {200, _aug(%{html: Earmark.as_html!(text)})}
    end
  end
  def convert(_), do: {400, %{error_message: "missing `text' query parameter"}}
  
  defp _aug(resp) do 
    resp
    |> Map.merge( %{
      name: "Earmark",
      version: "#{_version()}",
      author: "Dave Thomas",
      website: "https://github.com/pragdave/earmark"
    })
  end

  defp _version do 
    {:ok, version} = :application.get_key(:earmark, :vsn)
    version
  end
end
