defmodule ElixirTicTacToeBasic.Player do
  @moduledoc """
  This module provides functions for making moves in the game.
  """

  def move(%{prompter: prompter} = state) do
    state
    |> prompter.get_input()
    |> update_board()
  end

  defp update_board(
         %{board: board, current_move: current_move, current_player: current_player} = state
       ) do
    Map.update(state, :board, board, fn board ->
      Map.put(board, current_move, current_player)
    end)
  end
end
