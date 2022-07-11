defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "it displays a formatted 3x3 board" do
    test_game = %TestGame{}

    formatted_board = Board.format_board(test_game.board)

    assert formatted_board == """
            1 | 2 | 3
           ---+---+---
            4 | 5 | 6
           ---+---+---
            7 | 8 | 9
           """
  end
end
