defmodule ElixirTicTacToeBasic.OutcomeChecker do
  @moduledoc """
  This module returns a value representing whether the game has an outcome
  """

  def game_status(%{board: board} = config) do
    values = Map.values(board)
    status = if is_game_over(values), do: :game_over, else: :in_progress

    log_game_status(config, status)
  end

  defp is_game_over(values) do
    Enum.all?(values, fn value ->
      value in ["X", "O"]
    end)
  end

  defp log_game_status(config, status) do
    Map.update(config, :game_status_log, [], fn game_status_log ->
      [status | game_status_log]
    end)
  end
end
