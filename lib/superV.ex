defmodule ServSUP do
  use Supervisor

  @moduledoc "
  Модуль определяет механику работы супервизора"

  @doc "Запуск супервизора
          разрываем связь с процессом оболочки iex
          сообщаем PID процесса супервизора "
  def start_link do
  {:ok,pid} = Supervisor.start_link(__MODULE__,[],[{:name,__MODULE__}])
  Process.unlink(pid)
  IO.puts("Genserver pid now is")
  Process.whereis(Serv)
  end

  @doc " Обратный вызов Супервизора
          настраиваем процесс-воркер"

  def init([]) do
    child = [worker(Serv,[],[])]
    supervise(child,[{:strategy,:one_for_one},{:max_restarts,1},{:max_seconds, 5}])

  end

  # Сюдя помещаем внутренние функции
end
