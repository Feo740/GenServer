defmodule Ttl120 do
require Logger
  def del120(nik) do
    receive do
      nik ->
        Logger.info("Начинаем отсчет")
        :timer.sleep(30_000)
        Logger.info("Начинаем отсчет закончен")
      try do
       {:atomic, [record]} = :mnesia.transaction(fn ->
       :mnesia.delete({:p_players, nik}) end)
      rescue
        error -> error
      end
      Logger.info("Запись #{nik} успешно удалена.")

    end
  end

end
