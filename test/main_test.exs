defmodule MainTest do
  use ExUnit.Case
  doctest Main

  test "it plays the game" do
    test_game = %TestGame{}

    test_game = Main.play(test_game)

    assert Enum.reverse(test_game.events) == [
      "Displayed message, 'Welcome to Tic Tac Toe!'",
      "Displayed message, 'Please choose a space (1-9):'",
      "Displayed board"
    ]
  end
end
