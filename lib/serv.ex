defmodule Serv do

  use GenServer

defmodule State do
  defstruct count: 0
end
# Метод для запуска генсервера
  def start_link() do
    GenServer.start_link(__MODULE__,[],[{:name,__MODULE__}])
  end
# Инициализация генсервера
  def init([]) do
    {:ok, []}
  end

# Функции обратного вызова для генсервер GenServer.handle_call/3
  def handle_call({nik},_from,state) do
    reply={:ok, Amn.rd_database(nik)}
    {:reply, reply, state}
  end
  def handle_call(:create,_from,state) do
    reply={:ok, Amn.start_database}
    {:reply, reply, state}
  end
  def handle_call(:write,_from,state) do
    reply={:ok, Amn.wr_database}
    {:reply, reply, state}
  end

  def handle_info(_info, state) do
    {:noreply, state}
  end

# клиентская часть
def zapros(nik), do: GenServer.call(__MODULE__,{nik})
def create_mnesia, do: GenServer.call(__MODULE__,:create)
def write_database, do: GenServer.call(__MODULE__,:write)
#def zapros1, do: GenServer.call(__MODULE__,:zapros1)

end
