defmodule Amn do

@moduledoc "В даннаом модуле создаем схему базы данных,
              таблицу, запускаем БД, записываем в нее начальные данные,
              определяем функцию чтения из БД по ключевому полю. "

@doc "Функция создания шаблона БД"
  def create_database do
    :mnesia.create_schema([node()])#создаем БД,в рабочем кат.
                                  #появится папка Mnesia.nonode@nohost
                                  #в этом каталоге созд файл schema.DAT
    :mnesia.create_table(:p_players,[{:disc_copies,[node()]},{:attributes,[:nikname, :name, :age, :games, :wins]}])
  end

@doc "Функция запуска БД"
  def start_database do
    :mnesia.start()
  end

@doc "Функция записи в БД начальных значений"
  def wr_database do
  :mnesia.transaction(fn ->
    :mnesia.write({:p_players, "hat", "Bill Smith", "45", 100, 40})
    :mnesia.write({:p_players, "bell", "Ann Pirson", "20", 10, 3})
    :mnesia.write({:p_players, "Rat", "Den Konnie", "45", 75, 37})
  end)
  end

@doc "Функция чтения записей из БД по ключевому полю"
@spec rd_database(string()) :: tuple()
  def rd_database(nik) do
   try do
    {:atomic, [record]} = :mnesia.transaction(fn ->
  :mnesia.read({:p_players, nik}) end)
   rescue
     error -> error
   end
  end

@doc "Функция останова БД"
  def stop_database do
    :mnesia.stop()
  end
end
