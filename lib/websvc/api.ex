defmodule Websvc.Api do  
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Websvc.Web, [])
    ]

    opts = [strategy: :one_for_one, name: Websvc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end  

