defmodule ElixirTicTacToeBasic.Board do
  @moduledoc """
  This module constructs a new board and holds board state
  """

  def new() do
    %{
      1 => 1,
      2 => 2,
      3 => 3,
      4 => 4,
      5 => 5,
      6 => 6,
      7 => 7,
      8 => 8,
      9 => 9
    }
  end
end
