defmodule ServTest do
  use ExUnit.Case # async: true #async:true - позволяем Эликсир выполнять наборы тестов параллельно
  doctest Serv

  setup_all do  # общий сценарий к выполнению, перед выполнением тестов
    IO.puts "Beginning all tests"
    ServSUP.start_l
    :timer.sleep(3_000)
    Serv.start_database
    :timer.sleep(2_000)

    on_exit fn ->
        IO.puts "Exit from all tests"
      end
      {:ok,[]}
  end

  test "Read from your perfect database" do
    assert Serv.zapros("hat") == {:ok, {:atomic, [{:p_players, "hat", "Bill Smith", "45", 100, 40}]}}
  end

  test "Wrong question to your perfect database" do
    assert Serv.zapros("_rat") == {:ok, %MatchError{term: {:atomic, []}}}
  end
end
