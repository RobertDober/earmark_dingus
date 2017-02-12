defmodule EarmarkDingus2.Router do
  use EarmarkDingus2.Web, :router


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EarmarkDingus2 do
    pipe_through :api
    get "/", EarmarkController, :show
    get "/alive", EarmarkController, :alive
  end

  # Other scopes may use custom stacks.
  # scope "/api", EarmarkDingus2 do
  #   pipe_through :api
  # end
end
