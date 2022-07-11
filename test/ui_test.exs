defmodule UiTest do
  use ExUnit.Case
  doctest Ui

  test "it displays messages to the user when the game starts" do
    test_game = %TestGame{}

    test_game = Ui.start_game(test_game)

    assert Enum.reverse(test_game.events) == [
             "Displayed message, 'Welcome to Tic Tac Toe!'",
             "Displayed message, 'Please choose a space (1-9):'",
             "Displayed board"
           ]
  end
end
