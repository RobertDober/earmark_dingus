defmodule EarmarkDingus12.Earmark do

  @template %{
    name:     "Earmark",
    version:  "2B filled in",
    html:     "2B filled in",
    author:   "Dave Thomas",
    website:  "https: //github.com/pragdave/earmark"
  }
  @max_length 2000

  def convert_to_response(text) do
    # IO.puts ">>>convert_to_response(#{inspect text})"
    if String.length(text) > @max_length do
      merge(error: "text parameter exceeds authorized length of #{@max_length}")
    else
      convert_text(text)
    end
  end

  def convert_text(text) do
    # IO.puts ">>>convert_text(#{inspect text})"
    case Earmark.as_html(text) do
      {_, html, _}     -> merge(html: html)
    end
  end

  defp version do
    Earmark.version() |> to_string()
  end

  defp merge([html: html]) do
    Map.merge(@template, %{version: version(), html: html})
  end
end
