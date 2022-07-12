defmodule MainTest do
  use ExUnit.Case
  doctest Main

  test "it plays the game" do
    test_game = %TestGame{}

    test_game = Main.play(test_game)

    assert Enum.reverse(test_game.events) == [
             "welcome",
             "choose a space",
             "display board"
           ]
  end
end
