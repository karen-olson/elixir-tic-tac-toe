defmodule ElixirTicTacToeBasic.Presenter do
  @moduledoc """
  Presents a formatted 3x3 board
  """

  def present(board) do
    """
     #{board[1]} | #{board[2]} | #{board[3]}
    ---+---+---
     #{board[4]} | #{board[5]} | #{board[6]}
    ---+---+---
     #{board[7]} | #{board[8]} | #{board[9]}
    """
  end
end
