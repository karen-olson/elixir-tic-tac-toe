defmodule PlayerTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Player

  describe "#move" do
    test "it places a mark in the player's selected space" do
      state = %{
        board: Helpers.EmptyBoard.empty_board(),
        current_move: 5,
        current_player: "X"
      }

      board_with_first_move = %{
        1 => 1,
        2 => 2,
        3 => 3,
        4 => 4,
        5 => "X",
        6 => 6,
        7 => 7,
        8 => 8,
        9 => 9
      }

      %{board: board} = ElixirTicTacToeBasic.Player.move(state)

      assert board == board_with_first_move
    end
  end
end
