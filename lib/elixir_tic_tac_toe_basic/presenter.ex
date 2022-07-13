defmodule ElixirTicTacToeBasic.Presenter do
  @moduledoc """
  Presents a formatted 3x3 board
  """

  def present(board) do
    """
     #{board[{0, 0}]} | #{board[{0, 1}]} | #{board[{0, 2}]}
    ---+---+---
     #{board[{1, 0}]} | #{board[{1, 1}]} | #{board[{1, 2}]}
    ---+---+---
     #{board[{2, 0}]} | #{board[{2, 1}]} | #{board[{2, 2}]}
    """
  end
end
