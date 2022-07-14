defmodule ElixirTicTacToeBasic.Player do
  @moduledoc """
  This module provides functions for making moves in the game.
  """

  def move(state) do
    Map.update(state, :board, %{}, fn board -> Map.put(board, {1, 1}, "X") end)
  end
end
