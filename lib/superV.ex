defmodule ServSUP do
  use Supervisor

  # Вспомагательный метод для запуска
  def start_l do
  {:ok,pid} = Supervisor.start_link(__MODULE__,[],[{:name,__MODULE__}])
  Process.unlink(pid)
  IO.puts("Genserver pid now is")
  Process.whereis(Serv)
  end

  # Обратный вызов Супервизора

  def init([]) do
    child = [worker(Serv,[],[])]
    supervise(child,[{:strategy,:one_for_one},{:max_restarts,1},{:max_seconds, 5}])

  end

  # Сюдя помещаем внутренние функции
end
