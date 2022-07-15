defmodule PresenterTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Presenter

  describe "#present/1" do
    test "it presents a formatted 3x3 board" do
      board = Helpers.EmptyBoard.empty_board()

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
end
