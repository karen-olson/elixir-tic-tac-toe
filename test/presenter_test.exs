defmodule PresenterTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Presenter

  test "it presents a formatted 3x3 board" do
    board = %{
      {0, 0} => 1,
      {0, 1} => 2,
      {0, 2} => 3,
      {1, 0} => 4,
      {1, 1} => 5,
      {1, 2} => 6,
      {2, 0} => 7,
      {2, 1} => 8,
      {2, 2} => 9
    }

    formatted_board = ElixirTicTacToeBasic.Presenter.present(board)

    assert formatted_board == """
            1 | 2 | 3
           ---+---+---
            4 | 5 | 6
           ---+---+---
            7 | 8 | 9
           """
  end
end
