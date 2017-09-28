defmodule D_apl do
  @moduledoc "Главный модуль приложения"
  use Application


  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    childrens = [supervisor(ServSUP, [],[])]
    opts = [strategy: :one_for_one, name: Serv.Supervisor]
    Supervisor.start_link(childrens, opts)
  end

end
