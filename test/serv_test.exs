defmodule ServTest do
  use ExUnit.Case
  doctest Serv

  test "greets the world" do
    assert Serv.hello() == :world
  end
end
