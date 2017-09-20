defmodule Ad_db do

  def add_to_database do
      receive do
      msg ->  IO.puts("Вам выпала честь дополнить нашу таблицу!")
              :timer.sleep(2_000)
              nik = String.trim(IO.gets("Введите ник игрока:"))
             name = String.trim(IO.gets("Введите имя игрока:"))
             age = String.trim(IO.gets("Введите возраст игрока:"))
            games = String.to_integer(String.strip(IO.gets("Введите количество игр:")))
            wins = String.to_integer(String.strip(IO.gets("Введите количество побед:")))
            :mnesia.transaction(fn ->:mnesia.write({:p_players, nik, name, age, games, wins}) end)
        #new record = {:ok_record, nik, name, age, games, wins}
      end
  end
end
