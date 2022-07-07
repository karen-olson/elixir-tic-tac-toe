defmodule ElixirTicTacToeBasicTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic

  test "greets the world" do
    assert ElixirTicTacToeBasic.hello() == :world
  end
end
