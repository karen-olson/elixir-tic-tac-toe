defmodule Board do
  @moduledoc """
  This module produces a 3x3 formatted Tic Tac Toe board.
  """

  def format_board(board) do
    """
     #{board[{0, 0}]} | #{board[{0, 1}]} | #{board[{0, 2}]}
    ---+---+---
     #{board[{1, 0}]} | #{board[{1, 1}]} | #{board[{1, 2}]}
    ---+---+---
     #{board[{2, 0}]} | #{board[{2, 1}]} | #{board[{2, 2}]}
    """
  end
end
