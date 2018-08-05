defmodule EarmarkDingus12Web.Router do
  use EarmarkDingus12Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EarmarkDingus12Web do
    pipe_through :api # Use the default browser stack

    get "/", PageController, :index
    get "/version", PageController, :version
  end

  # Other scopes may use custom stacks.
  # scope "/api", EarmarkDingus12Web do
  #   pipe_through :api
  # end
end
