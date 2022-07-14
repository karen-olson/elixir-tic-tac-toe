defmodule ElixirTicTacToeBasic.Player do
  @moduledoc """
  This module provides functions for making moves in the game.
  """

  def move(%{board: board, prompter: prompter, current_player: current_player} = state) do
    Map.update(state, :board, board, fn board ->
      Map.put(board, prompter.get_input, current_player)
    end)
  end
end
