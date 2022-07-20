defmodule ElixirTicTacToeBasic.OutcomeChecker do
  @moduledoc """
  This module returns a value representing whether the game has an outcome
  """

  def check_full(%{board: board} = _config) do
    values = Map.values(board)

    Enum.all?(values, fn value ->
      value in ["X", "O"]
    end)
  end
end
