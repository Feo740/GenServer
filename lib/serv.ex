defmodule Serv do

  use GenServer
# Метод для запуска генсервера
  def start_link (state \\ [])do
    GenServer.start_link(__MODULE__,state,[{:name,__MODULE__}])
  end
# Инициализация генсервера
  def init(state) do
    {:ok, state}
  end
# Функции обратного вызова для генсервер GenServer.handle_call/3
def handle_call(:zapros,_from,[value|state]) do
  {:reply,value,state}
end
def handle_call(:zapros,_from,[]) do
  {:reply,nil,[]}
end
def handle_call(:zapros1,_from,state) do
  {:reply,state,state}
end
# клиентская часть
def zapros, do: GenServer.call(__MODULE__,:zapros)
def zapros1, do: GenServer.call(__MODULE__,:zapros1)

end
