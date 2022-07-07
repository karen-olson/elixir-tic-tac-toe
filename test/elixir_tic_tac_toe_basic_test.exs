defmodule ElixirTicTacToeBasicTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic

  test "welcome" do
    assert ElixirTicTacToeBasic.welcome() == :ok
  end
end
