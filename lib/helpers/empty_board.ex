defmodule Helpers.EmptyBoard do
  @moduledoc """
  This module returns an empty board.
  """

  def empty_board() do
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
