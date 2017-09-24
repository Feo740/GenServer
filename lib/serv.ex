defmodule Serv do
  use GenServer

@moduledoc "Основной модуль приложения - генсервер "

@doc "Функция состояния, навырост ака заглушка"
defmodule State do
  defstruct count: 0
end
@doc "Метод для запуска генсервера"
  def start_link() do
    GenServer.start_link(__MODULE__,[],[{:name,__MODULE__}])
  end
@doc "Метод инициализации генсервера"
  def init([]) do
    {:ok, []}
  end

@doc "Передаем в вызове ключевое поле записи БД, возвращаем запись"
  def handle_call({nik},_from,state) do
    reply={:ok, Amn.rd_database(nik)}
    {:reply, reply, state}
  end

  @doc "Передаем в вызове :create, создаем базу данных"
  def handle_call(:create,_from,state) do
    reply={:ok, Amn.create_database}
    {:reply, reply, state}
  end

  @doc "Передаем в вызове :write, записываем в БД начальные значения"
  def handle_call(:write,_from,state) do
    reply={:ok, Amn.wr_database}
    {:reply, reply, state}
  end

  @doc "Передаем в вызове :start, запускаем БД"
  def handle_call(:start_db,_from,state) do
    reply={:ok, Amn.start_database}
    {:reply, reply, state}
  end

  @doc "Передаем в вызове :ad_to_db, Запускаем новый процесс добавления записи"
  def handle_call(:add_to_db,_from,state) do
    pid1=spawn(Ad_db, :add_to_database, [])
    send(pid1, 1)
    reply={:ok, pid1}
    {:reply, reply, state}
  end



 @doc "Обрабатывает сообщения не относящиеся к OTP"
  def handle_info(_info, state) do
    {:noreply, state}
  end

@doc "клиентская часть, возвращаем запись по ключевому полю"
def zapros(nik), do: GenServer.call(__MODULE__,{nik})

@doc "клиентская часть, создаем БД"
def create_mnesia, do: GenServer.call(__MODULE__,:create)

@doc "клиентская часть, записываем начальные значения"
def write_database, do: GenServer.call(__MODULE__,:write)

@doc "клиентская часть, запускаем БД"
def start_database, do: GenServer.call(__MODULE__,:start_db)

@doc "клиентская часть, запускаем функции добавления новой записи в БД"
def add_to_database, do: GenServer.call(__MODULE__,:add_to_db)


end
